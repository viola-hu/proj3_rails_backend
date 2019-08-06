class ProductsController < ApplicationController
  def show
    product = Product.find params[:id]
    render json: product, include: :category
  end

  def index
    render json: Product.all
  end

  def search

    puts '*****************'
    puts 'this is search keyword', params[:q]
    puts '*****************'

    # double check if the search keyword is empty
    if params[:q].length == 0
      # if yes, return, do nothing
      return
    # if no, proceed to search
    else
      search_keyword = params[:q]
      # result is an array of matching products
      results = Product.where("name ILIKE ?", "%#{search_keyword}%")
      # send search results back to frontend in json format
      render json: results

    end
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
