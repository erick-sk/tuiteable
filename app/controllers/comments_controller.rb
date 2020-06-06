class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    p params
    @tuit = Tuit.find_by(params[:tuit_id])
    @tuit.comments.create!(user_id: current_user.id, body: params[:comment][:body], tuit_id: @tuit.id)

      redirect_to tuit_path(@tuit)

  end

end
