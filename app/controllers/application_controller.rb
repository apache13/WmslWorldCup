class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :authenticate , :except => [:login,:facebook] 
  helper_method :current_user
  
  private
  def current_user
    if(User.exists?(session[:user_id]))
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    else
      @current_user = false
    end
  end


  def authenticate
    if(User.exists?(session[:user_id]))
      redirect_to({ action: 'index' , :controller=>"main"})
    else
      redirect_to({ action: 'login' , :controller=>"main"})
    end
  end
  
end
