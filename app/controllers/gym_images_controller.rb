class GymImagesController < ApplicationController
  def new
    @gym_image = GymImage.new
  end

  def create
    @gym_image = GymImage.new(gym_image_params)
    @gym_image.user_id = current_user.id
    @gym_image.save
    redirect_to gym_images_path
  end

  def index
    @gym_images = GymImage.all
  end

  def show
    @gym_image = GymImage.find(params[:id])
    @gym_comment = GymComment.new
  end

  def edit
    @gym_image = GymImage.find(params[:id])
  end

  def update
    gym_image = GymImage.find(params[:id])
    gym_image.update(gym_image_params)
    redirect_to gym_image_path(gym_image)
  end

  def destroy
    @gym_image = GymImage.find(params[:id])
    @gym_image.destroy
    redirect_to gym_images_path
  end

  private

  def gym_image_params
    params.require(:gym_image).permit(:gym_name, :image, :intro)
  end
end
