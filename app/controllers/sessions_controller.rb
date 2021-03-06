class SessionsController < ApplicationController
  
  # skip_before_filter :require_login_permission, :only => [:create, :destroy]
  
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to({ action: 'index' , :controller=>"main"})
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to({ action: 'login' , :controller=>"main"})
  end
end
