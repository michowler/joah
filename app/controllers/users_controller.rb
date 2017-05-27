class UsersController < ApplicationController
	def new
	end

	def create
	  user = User.new(user_params)
	  if user.save
	    session[:user_id] = user.id
	    flash[:success] = "success"
	    redirect_to '/'
	  else
	  	flash[:danger] = user.errors.full_messages
	    redirect_to '/sign_up'
	  end
	end

	private
	def user_params
	  params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
	end
end
