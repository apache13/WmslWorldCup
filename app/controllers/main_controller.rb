class MainController < ApplicationController
  
  def login
  
  end
  def index
    @players = Player.all
    @matches_close = Match.where(:ready => true).order(:match)
    @matches_open = Match.where(:ready => false).order(:match)
  end
  def access_denied
    
  end
end
