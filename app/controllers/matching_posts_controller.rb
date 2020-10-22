class MatchingPostsController < ApplicationController
  def index
    @matching_posts = MatchingPost.where(status: 'active').all
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
    @article = Article.find(@matching_post.article_id) if @matching_post.article_id
    @time_frame = current_user.time_frames.new
    @time_frames = if @matching_post.user_id == current_user.id
                     @matching_post.time_frames.includes(:user).order(:time_frame)
                   else
                     @matching_post.time_frames.includes(:user).where(user_id: current_user.id).order(:time_frame)
                   end
  end

  def edit
    @matching_post = MatchingPost.find(params[:id])
    posts = current_user.articles.all
    @my_posts = {}
    posts.each do |post|
      @my_posts.merge!(post.title => post.id)
    end
  end

  def update
    @matching_post = MatchingPost.find(params[:id])
    if @matching_post.update(matching_post_params)
      redirect_to matching_post_path(@matching_post)
    else
      render 'edit'
    end
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
