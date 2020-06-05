# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tuits
  root  to: 'tuits#index'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/my_profile', to: 'users#show'
end
