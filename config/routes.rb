# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tuits
  root to: 'home#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/my_profile', to: 'users#show'

  namespace :api, defaults: { format: :json } do
    resources :users, only: %i[index show create update destroy] do
      resources :tuits, only: %i[index show], module: 'users'
    end
    resources :tuits, only: %i[index show create update destroy]
  end
end
