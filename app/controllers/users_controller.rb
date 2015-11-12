require 'byebug'

class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to '/'
		else
			redirect_to '/signup'
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)
		byebug
		redirect_to '/'
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
	end
end
