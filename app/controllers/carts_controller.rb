class CartsController < ApplicationController
  before_action :authenticate_user

  def show
    # puts '***********************'
    # puts current_user
    # puts current_user.id
    # puts current_user.name
    # puts current_user.cart
    # puts current_user.cart.line_items
    # puts '***********************'
    line_items = current_user.cart.line_items.order(created_at: :asc) # an array of all line_items

    render json: line_items, include: :product

    # no need of user info
    # render json: line_items, include: {
    #   product:{},
    #   cart: {
    #     include:{
    #       user:{
    #         only: [:name, :email]
    #       }
    #     }
    #   }
    # }

  end
end
