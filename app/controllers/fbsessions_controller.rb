class FbsessionsController < ApplicationController
	def new
	end

	def create
		user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
	end

end
