class OrdersController < ApplicationController

  before_action :authenticate_user

  def create
    # 1) create a new order, using the current_user's id
    order = Order.create(user_id: current_user.id)

    # 2) find the current_user's cart's line_items
    current_line_items = current_user.cart.line_items

    # an array of each line_item object
    current_line_items.each do |line_item|
      # 3) change the line_item's cart_id to nil to stop the association with cart
      line_item.cart_id = nil
      # 4) meanwhile, attach the line_item to the new order
      order.line_items << line_item
    end

    # 5) also, need to deduct the purchased quantity of the product from its existing number
    order.after_payment_change_product_stock

    render json: order

  end





end
