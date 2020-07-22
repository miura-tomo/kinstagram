class GymCommentsController < ApplicationController
  def create
    gym_image = GymImage.find(params[:gym_image_id])
    comment = current_user.gym_comments.new(gym_comment_params)
    comment.gym_image_id = gym_image.id
    comment.save
    redirect_to gym_image_path(gym_image)
  end

  def destroy
    GymComment.find_by(id: params[:id], gym_image_id: params[:gym_image_id]).destroy
    redirect_to gym_image_path(params[:gym_image_id])
  end

  private

  def gym_comment_params
    params.require(:gym_comment).permit(:comment)
  end
end
