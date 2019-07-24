class LineItemsController < ApplicationController

  before_action :authenticate_user

  def create

    product_id = params[:line_item][:product_id]
    wanted_quantity = params[:line_item][:quantity]
    cart_id = current_user.cart.id

    p '*****************************'
    p 'this is the product id:', product_id
    p 'this is the wanted_quantity:', wanted_quantity
    p 'this is the cart_id:', cart_id
    p '*****************************'


    ##################CONTINUE!!!!########################
    # 1) double confirm in the DB, if the requested quantity of the product is <= stock
    # if not, send error message back to front end
    product = Product.find(product_id)

    if wanted_quantity > product.stock
      render json: {error: 'Sorry, not enough stock.'}
    else
      # if yes,
      # 1, find_or_create_by a line_item
      current_line_item = LineItem.find_or_create_by product_id: product_id, cart_id: cart_id
      # 2, add quantity to the current_line_item
      # no matter if it's a new line_item (default quantity is 0) or it's an existing line_item, add the wanted_quantity to the existing quantity
      updated_line_item_quantity = current_line_item.quantity + wanted_quantity

      # save the current_line_item updated quantity
      current_line_item.update quantity: updated_line_item_quantity

      # 3, send success message back to frontend
      render json: current_line_item, include: :product
    end




    #
    # line_item = LineItem.new(line_item_params)
    # line_item.cart_id = current_user.cart.id
    # line_item.save
    #
    # if line_item.persisted?


  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity)
  end

  def check_if_any_existing_line_item(product_id, user)

  end
end
