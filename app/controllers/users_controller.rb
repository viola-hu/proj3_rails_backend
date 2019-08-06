class UsersController < ApplicationController

  before_action :authenticate_user, except: [:create]

  def create
    user = User.create user_params

    if user.persisted?
      # if a user has been saved, create a cart for this user immediately
      cart = Cart.create({user_id: user.id})

      render json:{success: true, cart: cart}
    else
      render json:{errors: user.errors.full_messages}, status: 422
    end
  end

  def show
    total_products_number_in_cart = current_user.get_total_products_number_in_cart

    render json:{
      current_user_email: current_user.email,
      current_user_name: current_user.name,
      products_number: total_products_number_in_cart
    }
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
