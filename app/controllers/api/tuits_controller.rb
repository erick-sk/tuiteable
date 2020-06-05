# frozen_string_literal: true

class Api::TuitsController < ApiController
  acts_as_token_authentication_handler_for User, only: [:index]

  def index
    tuits = Tuit.all
    render json: tuits, status: :ok
  end

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { status: 'Successfully destroyed', data: user }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :bio, :location, :password)
  end
end
