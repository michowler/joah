class SessionsController < ApplicationController

	def create_facebook
	  user = User.from_omniauth(env["omniauth.auth"])
	  session[:user_id] = user.id
	  flash[:success] = "Signed in with #{env["omniauth.auth"].provider.capitalize}!"
	  redirect_to root_path 
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:success] = "Welcome back!"
			redirect_to '/'
		else
			flash.now[:danger] = "#{user.errors.full_messages}"
			respond_to do |format|
				format.js { flash.now[:danger] }
			end
		end
	end

	def destroy
		session.delete(:user_id)
		flash[:danger] = "Logged Out!"
		redirect_to '/'
	end

end


