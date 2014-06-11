class MainController < ApplicationController
  
  before_filter :require_login_permission , :except => [:login]

  def login
  
  end
  def index
    @tables = Player.all.order(:id).collect.sort{ |a,b| b.pts <=> a.pts }
    @matches_close = Match.where(:closed => true).order("datetime(:match) DESC").limit(5)
    @matches_open = Match.where(:closed => false).order("datetime(:match) ASC").limit(5)
    @bets = Bet.joins(:match).where("player_id = ? and matches.closed = ? ",current_user.player,false).order("datetime(matches.match) ASC")
  end
  def access_denied
    
  end
end
