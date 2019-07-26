class CategoriesController < ApplicationController
  def index
  end

  def show
    category = Category.find params[:id]
    
    render json: category.products.order(id: :asc)
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
