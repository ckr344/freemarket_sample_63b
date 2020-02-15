Rails.application.routes.draw do
  devise_for :users
  root "product#index"
  resources :users
  resources :products
  resources :categories
end
