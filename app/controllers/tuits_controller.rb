class TuitsController < ApplicationController
  def index
    @tuits = Tuit.all
  end

  def show
  end

  def create
  end

  def new
  end

  def destroy
  end
end
