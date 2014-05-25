class MainController < ApplicationController
  
  before_filter :require_login_permission , :except => [:login]

  def login
  
  end
  def index
    @players = Player.all
    @matches_close = Match.where(:closed => true).order(:match)
    @matches_open = Match.where(:closed => false).order(:match)
    @bets = Bet.all
  end
  def access_denied
    
  end
end
