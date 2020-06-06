class LikesController < ApplicationController
  before_action :find_tuit

  def create
    @like = Like.find_by(tuit_id: @tuit.id, user_id: current_user.id)
    if !@like
      @tuit.likes.create!(user_id: current_user.id)
    else
      @like.destroy
    end
    redirect_to "/tuits"
  end

  def find_tuit
    @tuit = Tuit.find(params[:tuit_id])
  end 
end
