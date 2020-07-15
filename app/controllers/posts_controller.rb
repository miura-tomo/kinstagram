class PostsController < ApplicationController
	before_action :authenticate_user!


	def top
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path, notice: "投稿に成功しました。"
		else
			render :new
		end
	end

	def index
 @posts = Post.page(params[:page]).per(6).order('updated_at DESC')
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = PostComment.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		post.update(post_params)
		redirect_to post_path(post.id)
	end

	def destroy
		@post =Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:food_name, :image, :caption,)
	end

end