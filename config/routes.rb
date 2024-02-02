Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'dashboard', to: "pages#dashboard", as: 'dashboard'
  resources :pots
  resources :requests, only: [:index, :create, :update]
  resources :payments, only: [:index, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
