class Api::V1::ProductsController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :basic_auth

    def index
        @products = Product.all
        render json: { products: @products }
    end

    def create
        @product = Product.create(product_params)   
        if @product.save
          render json: @product
        else
          render json: { errors: @product.errors }, status: 422
        end
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
          render json: @product
        else
          render json: { errors: @product.errors }, status: 422
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
    
        head :no_content
    end
    

  private

    def product_params
      params.require(:product).permit(:name, :price)
    end

    def basic_auth 
      aunthenticate_or_request_with_http_basic do |user, password|
        user == "david" && password == "test123"
      end
    end
end
