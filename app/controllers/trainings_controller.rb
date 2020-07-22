class TrainingsController < ApplicationController
  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    @training.user_id = current_user.id
    @training.save
    redirect_to trainings_path
  end

  def index
    @trainings = Training.all
  end

  def show
    @training = Training.find(params[:id])
    @training_comment = TrainingComment.new
  end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to trainings_path
  end

  private

  def training_params
    params.require(:training).permit(:training_name, :image, :explain)
  end
end
