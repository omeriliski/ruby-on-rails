module Api
    class BrandsController < ApplicationController
        before_action :authenticate_user!, except: [:index, :show]
        before_action :read_cache, only: [:index, :show]
        before_action :get_brand, only: [:show, :update, :destroy]
        after_action -> { write_cache(@brands || @brand) }, only: [:index, :show], if: -> { @is_cached == false }
        after_action -> { remove_cache }, only: [:create, :update, :destroy], if: -> { response.successful? }

        def index
            @brands = Brand.all
            if !@brands.blank?
                @message = "Brands found successfully"
                render :index, status: :ok
            else
                @message = "No brands found"
                handler_error
            end
        end

        def show
            if !@brand.blank?
                @message = "Brand found successfully"
                render :show, status: :ok
            else
                @message = "Brand not found"
                handler_error
            end
        end

        def create
            @brand = Brand.create(brand_params)    
            if @brand.valid?
                @brand.save
                @message = "Brand created successfully"
                render :create, status: :ok
            else
                @message = @brand.errors.full_messages
                handler_error
            end
        end

        def update
            if @brand.update(brand_params)
                @message = "Brand updated successfully"
                render :update, status: :ok
            else
                @message = "Brand update failed"
                handler_error
            end
        end

        def destroy
            if @brand.destroy
                @message = "Brand deleted successfully"
                render :destroy, status: :ok
            else
                @message = "Brand deletion failed"
                handler_error
            end
        end

        def brand_params
            params.permit(:name)
        end

        def handler_error
            render :error, status: :bad_request
        end

        def get_brand
            @brand = Brand.find_by(id: params[:id])
            if @brand.nil?
                @message = "Brand not found"
                handler_error
            end
        end
    end
end