# frozen_string_literal: true

require 'rails_helper'

describe Api::UsersController do
  describe 'GET to index' do
    it 'returns http status ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'render json with all users' do
      User.create(username: 'erick-sk-one', name: 'User test-api', location: 'Piura', bio: 'Dev-codeable', email: 'onesimo@mail.com', password: '123456')
      User.create(username: 'dsacxzcxz', name: 'czxcxzzcxzc', location: 'Piura', bio: 'Dev-codeable', email: 'ondsadasimo@mail.com', password: '123456')
      get :index
      users = JSON.parse(response.body) # [{"username" => "erick-sk-one" .........}, {"username" => "erick-sk-one" .........}]
      expect(users.size).to eq 2
    end
  end

  describe 'GET to show' do
    it 'returns http status ok' do
      user = User.create(username: 'erick-sk-one', name: 'User test-api', location: 'Piura', bio: 'Dev-codeable', email: 'onesimo@mail.com', password: '123456')
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end

    it 'returns user data' do
      user = User.create(username: 'erick-sk-one', name: 'User test-api', location: 'Piura', bio: 'Dev-codeable', email: 'onesimo@mail.com', password: '123456')
      get :show, params: { id: user.id }
      user_response = JSON.parse(response.body)
      expect(user_response['username']).to eq user.username
      expect(user_response['name']).to eq user.name
      expect(user_response['location']).to eq user.location
      expect(user_response['bio']).to eq user.bio
      expect(user_response['email']).to eq user.email
    end
  end

  describe 'POST to create' do
    it 'returns http status created' do
      post :create, params: { user: { username: 'amiguito', name: 'Albert', email: 'ashdashj@dasmdsa.com', password: '123456' } }
      expect(response).to have_http_status(:created)
    end

    it 'returns user data created' do
      post :create, params: { user: { username: 'amiguito', name: 'Albert', email: 'ashdashj@dasmdsa.com', password: '123456' } }
      user_response = JSON.parse(response.body)
      expect(user_response['username']).to eq 'amiguito'
      expect(user_response['name']).to eq 'Albert'
      expect(user_response['location']).to eq nil
      expect(user_response['bio']).to eq nil
      expect(user_response['email']).to eq 'ashdashj@dasmdsa.com'
    end
  end

  describe 'PUT to update' do
    it 'returns http status ok' do
      user = User.create(username: 'erick-sk-one', name: 'User test-api', location: 'Piura', bio: 'Dev-codeable', email: 'onesimo@mail.com', password: '123456')
      request.headers['X-User-Email'] = user.email
      request.headers['X-User-Token'] = user.authentication_token
      put :update, params: { id: user.id, user: { name: 'Holi woli' } }
      expect(response).to have_http_status(:ok)
    end

    it 'returns user data update' do
      user = User.create(username: 'erick-sk-one', name: 'User test-api', location: 'Piura', bio: 'Dev-codeable', email: 'onesimo@mail.com', password: '123456')
      request.headers['X-User-Email'] = user.email
      request.headers['X-User-Token'] = user.authentication_token
      put :update, params: { id: user.id, user: { name: 'Holi woli', username: 'asdfg' } }

      user_response = JSON.parse(response.body)
      expect(user_response['username']).to eq 'asdfg'
      expect(user_response['name']).to eq 'Holi woli'
      expect(user_response['location']).to eq 'Piura'
      expect(user_response['bio']).to eq 'Dev-codeable'
      expect(user_response['email']).to eq 'onesimo@mail.com'
    end
  end
end
