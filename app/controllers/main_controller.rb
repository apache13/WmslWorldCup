class MainController < ApplicationController
  
  before_filter :require_login_permission , :except => [:login]

  def login
  
  end
  def index
    
    players = Player.all.order(:id)
    players.each do |player|
      player.calculate
    end
    
    @tables = players.collect.sort do |a,b| 
      
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
    
    @matches_close = Match.where(:closed => true).order("datetime(:match) DESC").limit(5)
    @matches_open = Match.where(:closed => false).order("datetime(:match) ASC").limit(5)
    @bets = Bet.joins(:match).where("player_id = ? and matches.closed = ? ",current_user.player,false).order("datetime(matches.match) ASC")
    
  end
  def access_denied
    
  end
end
