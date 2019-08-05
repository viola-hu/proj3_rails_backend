class ChargesController < ApplicationController

  before_action :authenticate_user

  # rescue_from Stripe::CardError, with: :catch_exception

  require 'stripe'

  def create

    # puts '******************'
    # puts 'current_user is', current_user
    # puts '******************'

    # #################### TODO: ####################3
    # need to safely store the api_key, instead of let them expose in this file!
    # https://blog.arkency.com/2017/07/how-to-safely-store-api-keys-in-rails-apps/
    # # test environment, Secret key
    # Publishable key: 'pk_test_dBB7Zc6zujggRBFHQUdShiJg00Ee8VeuNR'


    Stripe.api_key = Rails.application.secrets.stripe_api_secret
    # Stripe.api_key = 'sk_test_gmIUX1P9xjieMFubvMsTy21S00BSOhPUGl'

    # user_email = current_user.email

    # puts '******************'
    # puts 'current_user.email is', current_user.email
    # puts '******************'


    puts '******************'
    puts 'params:', params
    puts 'params[:charge][:stripeToken]', params[:charge][:stripeToken] # tested, actual token!
    puts '******************'

    # Amount in cents(at least 50cents)!!! need to *100
    total_amount = current_user.cart.line_items.sum {|li| li.quantity * li.product.price * 100}

    puts '******************'
    puts 'total_amount is', total_amount
    puts '******************'

    #************ so far working **********

    begin
      # create a customer hash, to be used as charge data!
      customer = Stripe::Customer.create(
        email: current_user.email,
        # source: 'tok_visa', # for test environment
        source: params[:charge][:stripeToken]
      )

      # actual charge!
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: total_amount,
        description: "Purchase from V's Toy",
        currency: 'aud'
      })

      puts '******************'
      puts 'charge is', charge
      puts '******************'

      if charge[:outcome][:network_status] == "approved_by_network"
        render json: {status: 'Payment Successful'}
      end

    rescue Stripe::CardError => e
      render json: {
        message: 'Transaction unsuccessful. Please contact your card issuer for more details.'
        }, status: :not_acceptable
    end
  end
end
