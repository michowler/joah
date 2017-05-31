class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :current_user
  #after_filter -> { flash.discard }, if: -> { request.xhr? }
  #before_action :authorize, :only => [:show, :new]

    private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def current_order
      if !session[:order_id].nil?
        Order.find(session[:order_id])
      else
        Order.new
      end
    end

    # def authorize
    #     redirect_to sign_in_path 
    # end
 
end