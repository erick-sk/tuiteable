# frozen_string_literal: true

class Api::TuitsController < ApiController
  acts_as_token_authentication_handler_for User, only: %i[create update destroy]

  def index
    render json: Tuit.all, status: :ok
  end

  def show
    tuit = Tuit.find(params[:id])
    render json: tuit, status: :ok
  end

  def create
    tuit = Tuit.new(tuit_params)
    tuit.user = current_user
    if tuit.save
      render json: tuit, status: :created
    else
      render json: tuit.errors, status: :unprocessable_entity
    end
  end

  def update
    tuit = Tuit.find(params[:id])
    if tuit.update(tuit_params)
      render json: tuit, status: :ok
    else
      render json: tuit.errors, status: :unprocessable_entity
    end
  end

  def destroy
    tuit = Tuit.find(params[:id])
    tuit.destroy
    render json: { status: 'Successfully destroyed', data: tuit }, status: :ok
  end

  private

  def tuit_params
    params.require(:tuit).permit(:body)
  end
end
