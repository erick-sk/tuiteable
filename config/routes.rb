# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tuits
  root  to: 'home#index'


  devise_for :users
  get '/my_profile', to: 'users#show'
  
end
