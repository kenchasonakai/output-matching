class UsersController < ApplicationController
skip_before_action :require_login, only: [:new, :create]
	def index
		@users = User.all
	end

	def new
		@user = User.new
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
		@user_articles = @user.articles
		@matchings = Relationship.where(followed_id: @user.id).or(Relationship.where(follower_id: @user.id))
	end

	private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
