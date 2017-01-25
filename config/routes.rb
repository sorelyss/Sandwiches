Rails.application.routes.draw do
  
  namespace :admin do
    resources :users
resources :categories
resources :ingredients
resources :orders
resources :order_details

    root to: "users#index"
  end

  resources :orders
  post 'orders/opcion'
  post 'orders/PrimeraEtapa'
  root 'home#index'
  get '/stats' => 'stats#graph'

  devise_for :users
  #root "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
