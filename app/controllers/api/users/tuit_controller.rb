# frozen_string_literal: true

class Api::Users::TuitsController < ApiController
  def index
    user = User.find(params[:user_id])
    render json: user.tuits, status: :ok
  end

  def show
    user = User.find(params[:user_id])
    tuit = Tuit.find_by(user_id: user.id, id: params[:id])
  end
end
