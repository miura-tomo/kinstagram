class TrainingCommentsController < ApplicationController
	def create
		training = Training.find(params[:training_id])
		comment = current_user.training_comments.new(training_comment_params)
		comment.training_id = training.id
		comment.save
		redirect_to training_path(training)
	end

	def destroy
		TrainingComment.find_by(id: params[:id], training_id: params[:training_id]).destroy
		redirect_to training_path(params[:training_id])
	end

	private

	def training_comment_params
	params.require(:training_comment).permit(:comment)
    end

end