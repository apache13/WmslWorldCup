class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_filter :authenticate , :except => [:login, :logout, :facebook ,:access_denied ]

  @@admin_uid_list = ["10152042428021695"]

  def self.admin?(uid)
    if(@@admin_uid_list.include?(uid))
      return true
    else
      return false
    end
  end
  
  private
  def current_user
    if(User.exists?(session[:user_id]))
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    else
      @current_user = false
    end
  end

  def register
      @register = Player.exists?(uid: current_user.uid)
  end
  
  def authenticate
    if(current_user != false)
      logger.debug 'uid : '+current_user.uid
      
      logger.debug 'player : '+Player.exists?(uid: current_user.uid).to_s
      if(!register)
        session.delete(:return_to)
        redirect_to({ action: 'new' , :controller=>"players"})
      end
      
      logger.debug 'original_url   : '+request.original_url
      logger.debug 'store original_url : '+session[:return_to].to_s
      if(session[:return_to] != nil)
        redirect_to(session[:return_to])
      end
      session.delete(:return_to)
    else
      logger.debug 'store original_url   : '+request.original_url
      session[:return_to] = request.original_url
      redirect_to({ action: 'login' , :controller=>"main"})

    end
  end

  def require_admin_permission
    if(current_user != nil)
      logger.debug('request admin permission from uid: '+current_user.uid)
      if(@@admin_uid_list.include?(current_user.uid))
        logger.debug 'result : grant admin permission'
      else
        logger.debug 'result : reject admin permission'
        redirect_to({ action: 'access_denied' , :controller=>"main"})
      end
    else
      redirect_to({ action: 'login' , :controller=>"main"})
    end
  end

  
  
end
