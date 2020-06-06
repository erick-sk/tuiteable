class TuitsController < ApplicationController
  def index
    @tuits = Tuit.all
  end

  def show
    @tuit = Tuit.find_by_id(params[:id])
  end

  def create
    authorize @tuit
  end

  def new
  end

  def update 
    authorize @tuit
  end

  def destroy
    authorize @tuit
  end

  
end
