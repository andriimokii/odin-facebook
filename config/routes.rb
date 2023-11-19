Rails.application.routes.draw do
  devise_for :users, controllers: { registrations:      'users/registrations',
                                              sessions:           'users/sessions',
                                              confirmations:      'users/confirmations',
                                              omniauth_callbacks: 'users/omniauth_callbacks',
                                              passwords:          'users/passwords',
                                              unlocks:            'users/unlocks' }

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
