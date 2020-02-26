Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :users, only: [:edit, :update]
  resources :products
  resources :categories
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
end
