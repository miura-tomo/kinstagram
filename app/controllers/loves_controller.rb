class LovesController < ApplicationController
  def create
    training = Training.find(params[:training_id])
    love = current_user.loves.new(training_id: training.id)
    love.save
    redirect_to training_path(training)
  end

  def destroy
    training = Training.find(params[:training_id])
    love = current_user.loves.find_by(training_id: training.id)
    love.destroy
    redirect_to training_path(training)
  end
end
