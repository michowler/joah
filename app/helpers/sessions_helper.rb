module SessionsHelper
	  # This will return the current user, if they exist
	  # Replace with code that works with your application
	  def current_user
	    if session[:user_id]
	      @current_user ||= User.find(session[:user_id]) if session[:user_id]
	    end
	  end

	  # Returns true if current_user exists, false otherwise
	  def logged_in?
	    !current_user.nil?
	  end

	  def page
	      [params[:page].to_i - 1, 0].max
	  end
end
