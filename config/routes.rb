Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "cars#index"

  resources :cars, only: [:index, :show, :new, :create, :edit, :update]

  resources :offers, only: [:index, :show, :new, :create, :edit, :update]

  get '/check_login', to: 'application#check_login'
end
