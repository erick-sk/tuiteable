class TuitsController < ApplicationController
  def index
    @tuits = Tuit.all
    @tuit = Tuit.new
  end

  def show
    @tuit = Tuit.find_by_id(params[:id])
    @comment = Comment.new

  end

  def create
    @tuits = Tuit.all
    @tuit = current_user.tuits.new(tuit_params)
    if @tuit.save
      redirect_to tuit_path(@tuit)
    else
      render :index
    end
  end

  def new
    @tuit = Tuit.new
  end


  def update 
    authorize @tuit
  end

  def destroy
    authorize @tuit
  end

  private

  def tuit_params
    params.require(:tuit).permit(:body)
  end
  
end
