Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :users, only: [:edit, :update]
  resources :products
  resources :categories
end
