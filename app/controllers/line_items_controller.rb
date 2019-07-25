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
    # 1, find or create a line_item by its cart_id and product_id,
    # because one cart should only have one line_item for one product,
    current_line_item = LineItem.find_or_create_by product_id: product_id, cart_id: cart_id

    # 2, add wanted quantity to the ecurrent_line_item xisting quantity
    # no matter if it's a new line_item (default quantity is 0) or it's an existing line_item, add the wanted_quantity to the existing quantity
    updated_line_item_quantity = current_line_item.quantity + wanted_quantity

    # 3, double confirm if the updated_line_item_quantity is <= stock
    product = Product.find(product_id)

    if updated_line_item_quantity > product.stock
      # if > stock, send error message back to front end
      render json: {error: 'Sorry, not enough stock.'}, status:422
    else
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
    line_item = LineItem.find params[:id]
    updated_line_item_quantity = params[:line_item][:quantity]
    current_line_item_stock = line_item.product.stock

    p '*****************************'
    p 'this is the line_item:', line_item
    p 'this is the updated_line_item_quantity:', updated_line_item_quantity
    p 'line_item.product.stock', current_line_item_stock
    p '*****************************'

    # the updated_line_item_quantity is the total requested number of the product stored in the cart!
    # double check directly if the updated_line_item_quantity <= stock
    if updated_line_item_quantity <= current_line_item_stock
      # update line_item's quantity to the updated_line_item_quantity
      line_item.update quantity:updated_line_item_quantity
      # render back the whole cart info including this line_item
      render json: line_item.cart.line_items.order(created_at: :asc), include: :product
    else
      render json: {error: 'Sorry, not enough stock.'}, status:422
    end
  end



  def destroy
    line_item = LineItem.find params[:id]
    p '*****************************'
    p 'this is the line_item:', line_item
    p '*****************************'
    line_item.destroy

    render json: current_user.cart.line_items.order(created_at: :asc), include: :product
  end


  private

  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity)
  end


end
