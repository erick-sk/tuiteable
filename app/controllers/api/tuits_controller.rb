# frozen_string_literal: true

class Api::TuitsController < ApiController
  acts_as_token_authentication_handler_for User, only: [:index]

  def index
    p current_user
    tuits = Tuit.all
    render json: tuits, status: :ok
  end
end
