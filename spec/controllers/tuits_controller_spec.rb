# frozen_string_literal: true

require 'rails_helper'

describe Api::TuitsController do
  describe 'GET to index' do
    it 'returns http status ok' do
      user = User.create(username: 'asdsad', name: 'asdsada', email: 'djsah@dsa.com', password: '123456')
      Tuit.create(user_id: 1, body: 'holaa', user: user)
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'render json with all tuits' do
      user = User.create(username: 'asdsad', name: 'asdsada', email: 'djsah@dsa.com', password: '123456')
      Tuit.create(body: 'holaa', user: user)
      get :index
      tuits = JSON.parse(response.body)
      expect(tuits.size).to eq 1
    end
  end

  describe 'GET to show' do
    it 'returns http status ok' do
      user = User.create(username: 'asdsad', name: 'asdsada', email: 'djsah@dsa.com', password: '123456')
      tuit = Tuit.create(body: 'holaa', user: user)
      get :show, params: { id: tuit }
      expect(response).to have_http_status(:ok)
    end

    it 'returns user data' do
      user = User.create(username: 'asdsad', name: 'asdsada', email: 'djsah@dsa.com', password: '123456')
      tuit = Tuit.create(body: 'holaa', user: user)
      get :show, params: { id: tuit }
      tuit_response = JSON.parse(response.body)
      expect(tuit_response['user_id']).to eq user.id
      expect(tuit_response['body']).to eq tuit.body
    end
  end

  describe 'POST to create' do
    it 'returns http status created' do
      @user = User.create(username: 'asdsad', name: 'asdsada', email: 'djsah@dsa.com', password: '123456')
      @request.headers['X-User-Email'] = @user.email
      @request.headers['X-User-Token'] = @user.authentication_token
      post :create, params: { tuit: { body: 'holaaa' } }
      expect(response).to have_http_status(:created)
    end

    it 'returns user data created' do
      user = User.create(username: 'asdsad', name: 'asdsada', email: 'djsah@dsa.com', password: '123456')
      request.headers['X-User-Email'] = user.email
      request.headers['X-User-Token'] = user.authentication_token
      post :create, params: { tuit: { body: 'holaaa' } }
      tuit_response = JSON.parse(response.body)
      expect(tuit_response['user_id']).to eq user.id
      expect(tuit_response['body']).to eq 'holaaa'
    end
  end

  describe 'PUT to update' do
    it 'returns http status ok' do
      user = User.create(username: 'asdsad', name: 'asdsada', email: 'djsah@dsa.com', password: '123456')
      tuit = Tuit.create(body: 'holaa', user: user)
      request.headers['X-User-Email'] = user.email
      request.headers['X-User-Token'] = user.authentication_token

      put :update, params: { id: tuit.id, tuit: { body: 'holaaa' } }
      expect(response).to have_http_status(:ok)
    end

    it 'returns user data update' do
      user = User.create(username: 'asdsad', name: 'asdsada', email: 'djsah@dsa.com', password: '123456')
      tuit = Tuit.create(body: 'holaa', user: user)
      request.headers['X-User-Email'] = user.email
      request.headers['X-User-Token'] = user.authentication_token
      put :update, params: { id: tuit.id, tuit: { body: 'holaaa' } }

      user_response = JSON.parse(response.body)
      expect(user_response['user_id']).to eq tuit.user_id
      expect(user_response['body']).to eq 'holaaa'
    end
  end
end
