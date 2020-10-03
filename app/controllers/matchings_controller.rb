class MatchingsController < ApplicationController
	def index
		@matchings = Relationship.where(user_id: current_user.id).or(Relationship.where(followed_user_id: current_user.id))
	end

  def new
  end

  def create
    @matching = current_user.relationships.new(matching_params)
		@matching_post = MatchingPost.find(params[:matching][:matching_post_id])
    if @matching.save
      flash[:success] = 'マッチングしました'
      redirect_to matchings_path
			@matching_post.update(status: "finish")
    else
			flash[:danger] = 'マッチングに失敗しました'
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
    params.require(:matching).permit(:followed_user_id, :followed_user_post_id, :user_post_id, :matching_post_id)
  end
end
