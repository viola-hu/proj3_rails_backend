class ChargesController < ApplicationController

  before_action :authenticate_user

  # rescue_from Stripe::CardError, with: :catch_exception

  require 'stripe'

  def create

    Stripe.api_key = 'sk_test_gmIUX1P9xjieMFubvMsTy21S00BSOhPUGl'

    user_email = current_user.email

    puts '******************'
    puts 'current_user.email is', current_user.email
    puts '******************'

    # begin
    #
    #   customer = Stripe::Customer.create(
    #     email: ,
    #     source:
    #   )
    #
    # rescue
    #
    # end




  end
end
