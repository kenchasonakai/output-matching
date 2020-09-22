class MatchingsController < ApplicationController
	def new
		@matching = Matching.new
		@offering_post = OfferingPost.find(params[:offering_post_id])
	end
	def create
		@matching = Matching.new(matching_params)
		if @matching.save
			@matching.offering_post.status = "matching"
			flash[:success] = "マッチングしました"
			redirect_to user_path(current_user)
		else
			redirect_back(fallback_location: root_path)
		end
	end
	def show
		@matching = Matching.find(params[:id])
	end
	def destroy
		@matching = Matching.find(params[:id])
		@matching.destroy!
		redirect_to user_path(current_user)
	end

	private
	def matching_params
		params.require(:matching).permit(:user_id, :offering_post_id)
	end
end
