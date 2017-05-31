class UsersController < ApplicationController

	def new
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to @user
	end	

	def create
	  user = User.new(user_params)
	  if user.save
	    session[:user_id] = user.id
	    flash[:success] = "Hi, welcome to Joahh!"
	    redirect_to '/'
	  else
	  	flash[:danger] = user.errors.full_messages 
	    redirect_to '/sign_up'
	  end
	end

	private
	def user_params
	  params.require(:user).permit(:full_name, :email, :password, :contact, :password_confirmation)
	end
end
