class OrdersController < ApplicationController

  before_action :authenticate_user

  def create

    current_line_items = current_user.cart.line_items


    render json: current_line_items


  end
end
