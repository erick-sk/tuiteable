class TuitsController < ApplicationController
  def index
    @tuits = Tuit.all
  end

  def show
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
