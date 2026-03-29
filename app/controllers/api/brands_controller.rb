module Api
    class BrandsController < ApplicationController
        skip_before_action :verify_authenticity_token

        before_action :get_brand, only: [:show, :update, :destroy]

        def index
            @brands = Brand.all
            render json: @brands
        end

        def show
            render json: @brand
        end

        def create
            @brand = Brand.create(brand_params)    
            if @brand.valid?
                @brand.save
                render json: @brand
            else
                render json: { errors: @brand.errors.full_messages }, status: :unprocessable_entity
            end
        end

        def update
            @brand.update(brand_params)
            render json: @brand
        end

        def destroy
            @brand.destroy
            render json: { message: "Brand deleted successfully" }
        end

        def brand_params
            params.permit(:name)
        end

        def get_brand
            @brand = Brand.find(params[:id])
        end
    end
end