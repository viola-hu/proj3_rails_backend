Rails.application.routes.draw do


  post 'user_token' => 'user_token#create'

  resources :users, except: [:new, :create, :index]
  post '/signup' => 'users#create'

  resources :categories

  resources :products, except: [:new]

  resources :line_items, except: [:new, :edit, :index]

  get '/cart' => 'carts#show'

  get '/order'=> 'orders#create'

  get '/order/:id' => 'orders#show'
end
