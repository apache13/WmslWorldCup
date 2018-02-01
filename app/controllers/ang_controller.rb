class AngController < ApplicationController
  
  before_action :require_admin_permission 
    
  def index

  end
  
  def matches_close
    @matches_close = Match.where(:closed => true).order(match: :desc).limit(5)
    respond_to do |format|
      format.json  { render :json => @matches_close }
    end
  end
  
  def bets
    @bets = Bet.joins(:match).where("player_id = ? and matches.closed = ? ",current_user.player,false).order("datetime(matches.match) ASC")
    respond_to do |format|
      format.json  { render :json => @bets }
    end
  end
end
