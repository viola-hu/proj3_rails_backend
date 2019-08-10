class ChargesController < ApplicationController

  before_action :authenticate_user

  # rescue_from Stripe::CardError, with: :catch_exception

  require 'stripe'

  def create

    # puts '******************'
    # puts 'current_user is', current_user
    # puts '******************'



    Stripe.api_key = Rails.application.secrets.stripe_api_secret
    # Publishable key: 'pk_test_dBB7Zc6zujggRBFHQUdShiJg00Ee8VeuNR'

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

    # in case user clicked pay button multiple times,
    # check beforehand if the cart line-items have been moved to order already?
    # if yes, return directly, no need to call stripe to proceed
    if total_amount == 0
      return
    end

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
