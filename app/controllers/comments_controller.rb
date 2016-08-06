class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comments = @prototype.comments
    comment  = @prototype.comments.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(
      :text
      ).merge(
      user_id: current_user.id,
      prototype_id: params[:prototype_id])
  end

end
