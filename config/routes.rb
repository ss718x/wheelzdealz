Rails.application.routes.draw do
  get 'cars/index'
  get 'cars/show'
  get 'cars/new'
  get 'cars/create'
  devise_for :users
  root to: "cars#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
