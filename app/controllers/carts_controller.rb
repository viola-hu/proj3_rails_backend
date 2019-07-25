class CartsController < ApplicationController
  before_action :authenticate_user

  def show
    line_items = current_user.cart.line_items.order(created_at: :asc) # an array of all line_items

    render json: line_items, include: :product

  end
end
