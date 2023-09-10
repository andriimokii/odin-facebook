Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts do
    resources :comments
    resources :likes, only: %i[create destroy]
  end

  resources :comments do
    resources :likes, only: %i[create destroy]
  end

  resources :friendships, only: %i[create update destroy]
end
