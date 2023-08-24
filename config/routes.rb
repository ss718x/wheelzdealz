Rails.application.routes.draw do
  devise_for :users

  root to: "cars#index"

  resources :cars, only: [:index, :show, :new, :create]

  resources :offers, only: [:index, :show]

  get '/check_login', to: 'application#check_login'
end
