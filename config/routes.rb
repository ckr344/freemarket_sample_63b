Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  } 
  root "products#index"
  resources :users
  resources :products do
    collection do
      get 'category_children', defaults: { format: 'json'}
      get 'category_grandchildren', defaults: { format: 'json'}
    end
  end  
  resources :categories
  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay_show', to: 'cards#pay_show'
      post 'pay', to: 'cards#pay'
    end
  end
  # indexアクションは後ほど取引一覧表示で使用する
  resources :transactions, only: [:index] do
    collection do
      get 'pay_index', to: 'transactions#pay_index'
      post 'pay', to: 'transactions#pay'
      get 'done', to: 'transactions#done'
    end
  end
end
