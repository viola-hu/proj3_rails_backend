class UserTokenController < Knock::AuthTokenController

  skip_before_action :verify_authenticity_token

  # to avoid rails' own authenticate_token method, rails treat it as something from submit post method, so rails is checking if the params is in the right format etc, and in this case it's treating it as not legit, and give us error
  # 'Can't verify CSRF token authenticity.'
  # ActionController::InvalidAuthenticityToken (ActionController::InvalidAuthenticityToken):
  # thus, we need to use the above to skip rails own authenticate token step.
  
end
