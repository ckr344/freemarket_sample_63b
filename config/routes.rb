Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :users, only: [:edit, :update]
  resources :products
  resources :categories
  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay_show', to: 'cards#pay_show'
      post 'pay', to: 'cards#pay'
    end
  end
end
