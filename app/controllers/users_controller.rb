class UsersController < ApplicationController

  before_action :authenticate_user, except: [:create]

  def create
    user = User.create user_params

    if user.persisted?
      render json:{success: true}
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
