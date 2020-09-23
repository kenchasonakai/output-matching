class MatchingsController < ApplicationController
  def new
    @matching = Relationship.new
    @article = Article.find(params[:article_id])
    posts = current_user.offering_posts
    @my_posts = { "聞くだけ": '' }
    posts.each do |post|
      @my_posts.merge!(post.title => post.id)
    end
  end

  def create
    @matching = Relationship.new(matching_params)
    if @matching.save
      flash[:success] = 'マッチングしました'
      redirect_to user_path(current_user)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @matching = Relationship.find(params[:id])
  end

  def update
    @matching = Relationship.find(params[:id])
    @matching.update(status: params[:status])
  end

  def destroy
    @matching = Relationship.find(params[:id])
    @matching.destroy!
    redirect_to user_path(current_user)
  end

  private

  def matching_params
    params.require(:matching).permit(:followed_id, :follower_id, :followed_post_id, :follower_post_id)
  end
end
