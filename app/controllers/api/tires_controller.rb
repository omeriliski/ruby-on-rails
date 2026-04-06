module Api
    class TiresController < ApplicationController
        before_action :authenticate_user!, except: [:index, :show]
        before_action :read_cache, only: [:index, :show]
        before_action :get_tire, only: [:show, :update, :destroy]
        after_action -> { write_cache(@tires || @tire) }, only: [:index, :show], if: -> { @is_cached == false }
        after_action -> { remove_cache("index, show") }, only: [:create, :update, :destroy]

        after_action :log_file
        def index
            @tires = Tire.all
            if @tires.present?
                @message = "Tires found successfully"
                render :index, status: :ok
            else
                @message = "No tires found"
                handler_error
            end
        end

        def show
            if !@tire.blank?
                @message = "Tire found successfully"
                render :show, status: :ok
            else
                @message = "Tire not found"
                handler_error
            end
        end

        def create
            @tire = Tire.create(tire_params)
            authorize(@tire)
            if @tire.valid?
                @tire.save
                @message = "Tire created successfully"
                render :create, status: :ok
            else
                @message = @tire.errors.full_messages
                handler_error
            end
        end

        def update
            authorize(@tire)
            if @tire.update(tire_params)
                @message = "Tire updated successfully"
                render :update, status: :ok
            else
                @message = "Tire update failed"
                handler_error
            end
        end

        def destroy
            authorize(@tire)
            if(@tire.destroy)
                @message = "Tire deleted successfully"
                render :destroy, status: :ok
            else
                @message = "Tire deletion failed"
                handler_error
            end
        end

        private
        def handler_error
            render :error,status: :bad_request
        end

        def tire_params
            params.permit(:name, :brand_id, :width, :height, :inch, :season, :price, :list_price, :stock, :sku, :description, :tire_image)
        end

        def get_tire
            @tire = Tire.find_by(id: params[:id])
            if @tire.nil?
                @message = "Tire not found"
                handler_error
            end
        end
    end
end
