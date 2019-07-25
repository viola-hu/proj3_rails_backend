class ProductsController < ApplicationController
  def show
    product = Product.find params[:id]
    render json: product, include: :category
  end

  def index
    render json: Product.all
  end


  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
