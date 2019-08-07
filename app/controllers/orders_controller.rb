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

  def show

    order = Order.find params[:id]
    line_items = order.line_items
    # an array of line_items of that order

    render json: line_items, include: :product

  end

  def index
    orders = current_user.orders # array of all current_user's orders

    render json: orders,
      methods:[:order_created_at_date_formatted, :order_total_amount],
      include: {
        line_items: {
          include: {
            product: {
              only: [:name, :price, :image]
            }
          }
        }
      }
  end





end
