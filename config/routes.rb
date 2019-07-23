Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'

  resources :users, except: [:new, :create, :index]
  post '/signup' => 'users#create'

end
