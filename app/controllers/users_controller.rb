class UsersController < ApplicationController

	before_action :authenticate_user!,only:[:edit,:update,:destroy]
	def show
		@user = User.find(params[:id])
	end
	
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(users_params)
			redirect_to @user
		else
			render "Edit"
		end
	end

	private

		def users_params
			params.require(:user).permit(:name,:age,:region)
		end
end
