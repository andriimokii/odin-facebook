Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts, except: :index do
    resources :comments
    resources :likes, only: %i[create destroy]
  end

  resources :comments do
    resources :likes, only: %i[create destroy]
  end

  resources :friendships, only: %i[create update destroy]
  resources :users, only: %i[index show] do
    resources :posts, only: :index, module: :users
  end

  resources :notifications, only: %i[index destroy update]
end
