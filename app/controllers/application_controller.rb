class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user , :require_login_permission , :require_admin_permission , :player_edit_profile? , :player_sort


  # system constant
  @@admin_uid_list = ["10152042428021695"]
  @@register_new_player = false
  @@player_edit_profile = false


  @@payment_table = [0,
    5,
    10,
    15,15,15,15,15,
    20,20,20,20,20,
    25,25,25,25,25,
    30,30,30,30,30,
    35,35,35,35,35,
    40,40,40,40,40,
    45,45,45,45,45,
    50,50,50,50,50,
    55,55,55,55,60,
    60,60,60,65,70,
    75]
  
  def self.player_edit_profile?
    @@player_edit_profile
  end
  
  def self.register_new_player?
    @@register_new_player
  end
  
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

  def require_login_permission
    if(current_user != false)
      logger.debug 'uid : '+current_user.uid
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

  def player_sort(players)
    
    players = player_pts_sort(players)
    players.each_with_index do |player,index|
      player.pts_pos = index + 1
      player.pts_pay = player_pts_payment(player)
    end
    
    players = player_lpts_sort(players)
    players.each_with_index do |player,index|
      player.lpts_pos = index + 1
      player.lpts_pay = player_lpts_payment(player)
      player.total_pay = player.pts_pay + player.lpts_pay
    end
    
  end
  
  private
  def player_lpts_sort(players)
    
    players.each do |player|
      player.calculate
    end
    
    players.collect.sort do |a,b|
      comp = (b.lpts <=> a.lpts)
      if comp.zero?
        comp = (b.pts <=> a.pts)
        if comp.zero?
          comp = (b.win <=> a.win)
          if comp.zero?
            comp = (b.draw <=> a.draw)
            if comp.zero?
              comp = (a.loss <=> b.loss)
              if comp.zero?
              comp = (a.id <=> b.id)
              else
              comp
              end
            else
            comp
            end
          else
          comp
          end
        else
        comp
        end
      else
      comp
      end
    end
  end

  def player_pts_sort(players)
    
    players.each do |player|
      player.calculate
    end
    
    players.collect.sort do |a,b|
      comp = (b.pts <=> a.pts)
      if comp.zero?
        comp = (b.lpts <=> a.lpts)
        if comp.zero?
          comp = (b.win <=> a.win)
          if comp.zero?
            comp = (b.draw <=> a.draw)
            if comp.zero?
              comp = (a.loss <=> b.loss)
              if comp.zero?
              comp = (a.id <=> b.id)
              else
              comp
              end
            else
            comp
            end
          else
          comp
          end
        else
        comp
        end
      else
      comp
      end
    end
  end
  
  def player_pts_payment(player)
     return @@payment_table[player.pts_pos-1]
  end
  
  def player_lpts_payment(player)
    return @@payment_table[player.lpts_pos-1]
  end
  
end
