class LikesController < ApplicationController
	def create
		gym_image = GymImage.find(params[:gym_image_id])
		like = current_user.likes.new(gym_image_id: gym_image.id)
		like.save
		redirect_to gym_image_path(gym_image)
	end

	def destroy
		gym_image = GymImage.find(params[:gym_image_id])
		like = current_user.likes.find_by(gym_image_id: gym_image.id)
		like.destroy
		redirect_to gym_image_path(gym_image)
	end
end
