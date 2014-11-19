class UsersController < ApplicationController
	def new
		@user = User.new
	end
	
	def create
		@user = User.create(user_params)

		if @user.save
			flash[:notice] = "User created. Please login"
			redirect_to login_path
		else
			flash.new[:notice] = "User could not be created"
			render.new
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :full_name, :user_name, :password, :password_confirmation)
	end
end