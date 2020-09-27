class MatchingPostsController < ApplicationController
	def index
		@matching_posts = MatchingPost.all
		posts = current_user.articles.all
		@my_posts = {}
    posts.each do |post|
      @my_posts.merge!(post.title => post.id)
    end

	end
	def new
		@matching_post = MatchingPost.new
    posts = current_user.articles.all
    @my_posts = {}
    posts.each do |post|
      @my_posts.merge!(post.title => post.id)
    end
	end
	def preview
		@title = params[:title]
		@body = params[:body]
		@article_id = params[:article_id]
	end
	def create
		@matching_post = current_user.matching_posts.build(matching_post_params)
		if @matching_post.save
			redirect_to root_path
		else
			render 'new'
		end
	end
	def show
		@matching_post = MatchingPost.find(params[:id])
	end
	def edit
		@matching_post = MatchingPost.find(params[:id])
	end
	def update
	end
	def destroy
		@matching_post = MatchingPost.find(params[:id])
		@matching_post.destroy!
		redirect_to root_path
	end

	private
	def matching_post_params
		params.require(:matching_post).permit(:title, :body, :article_id)
	end
end
