Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "cars#index"

  resources :cars, only: [:index, :show, :new, :create]

  get '/check_login', to: 'application#check_login'
end
