class MainController < ApplicationController
  
  before_filter :require_login_permission , :except => [:login]

  def login
  
  end
  def index
    @tables = Player.all.order(:id).collect.sort{ |a,b| b.pts <=> a.pts }
    @matches_close = Match.where(:closed => true).order(:match)
    @matches_open = Match.where(:closed => false).order(:match)
    @bets = Bet.joins(:match).where("player_id = ? and matches.closed = ? ",current_user.player,false).order('matches.match')
  end
  def access_denied
    
  end
end
