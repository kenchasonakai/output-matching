class UsersController < ApplicationController
skip_before_action :require_login, only: %i[new create]
	def index
		@users = User.all
	end
	def new
		@user = User.new()
	end

	def create
		@user = User.new(user_params)
		if @user.save
			auto_login(@user)
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		@user_articles = @user.offering_posts
		@user_matchings = Matching.where(user_id: current_user.id)
	end

	private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
