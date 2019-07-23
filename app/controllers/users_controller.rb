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
