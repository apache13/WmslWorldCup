class MainController < ApplicationController
  
  before_filter :require_login_permission , :except => [:login]

  def login
  
  end
  def index
    
    players = Player.all.order(:id)
    @tables = player_sort(players)
    
    @matches_close = Match.where(:closed => true).order(match: :desc).limit(5)
    @matches_open = Match.where(:closed => false).order(match: :asc).limit(5)
    @bets = Bet.joins(:match).where("player_id = ? and matches.closed = ? ",current_user.player,false).order("datetime(matches.match) ASC")
    
    @total_pay = 0
    @tables.each do |player|
      @total_pay += player.total_pay
    end
    
    
    
  end
  def access_denied
    
  end
end
