class OfferingPostsController < ApplicationController
	def index
		@offering_posts = OfferingPost.where(status: 1).includes(:user)
	end
	def new
		@offering_post = current_user.offering_posts.new
	end

	def create
		@offering_post = current_user.offering_posts.new(post_params)
		if @offering_post.save
			redirect_to user_path(current_user)
		else
			render 'new'
		end
	end

	def show
		@offering_post = OfferingPost.find(params[:id])
	end

	def edit
		@offering_post = current_user.offering_posts.find(params[:id])
	end

	def update
		@offering_post = current_user.offering_posts.find(params[:id])
		@offering_post.update(post_params)
		redirect_to user_path(current_user)
	end

	def destroy
		@offering_post = current_user.offering_posts.find(params[:id])
		@offering_post.destroy!
		redirect_to user_path(current_user)
	end

	private

	def post_params
		params.require(:offering_post).permit(:title, :body, :status)
	end
end
