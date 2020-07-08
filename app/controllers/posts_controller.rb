class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
		redirect_to posts_path
	    else
	    render :new
	    end
	end

	def index
		@posts = Post.page(params[:page]).reverse_order
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = PostComment.new
	end



private
def post_params
	params.require(:post).permit(:food_name, :image, :caption,)
end

end