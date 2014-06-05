class Calculation < ActiveRecord::Base  
  
  after_save :link_bet
  
  belongs_to :player
  belongs_to :bet
  
  validates :bet , :player , presence: true
  validates_uniqueness_of :player, :scope => :bet
  
  private
  def link_bet
    self.bet.update(calculation: self)
  end
  
  public
  def calculate
    
    self.team_winner_point = 0
    self.score_point = 0
    self.penalty_point = 0
    self.yellow_card_point = 0
    self.red_card_point = 0
    self.own_goal_point = 0
    
    self.bonus_team_point = 0
        
    if(self.bet.match.result == self.bet.result)
      self.team_winner_point = 10
    else
      self.team_winner_point = 0
    end
    
    
    if(self.bet.match.team1_score == self.bet.team1_score)
      self.score_point += 10
    else
      self.score_point += 0
    end
    
    if(self.bet.match.team2_score == self.bet.team2_score)
      self.score_point += 10
    else
      self.score_point += 0
    end
    
    if(self.bet.match.penalty == self.bet.penalty)
      self.penalty_point += 10
    else
      self.penalty_point += -10
    end
    
    if(self.bet.match.yellow_card == self.bet.yellow_card)
      self.yellow_card_point += 10
    else
      self.yellow_card_point += -10
    end
    
    if(self.bet.match.red_card == self.bet.red_card)
      self.red_card_point += 10
    else
      self.red_card_point += -10
    end
    
    if(self.bet.match.own_goal == self.bet.own_goal)
      self.own_goal_point += 20
    else
      self.own_goal_point += -20
    end
    
    temp_cal_percent = self.team_winner_point + self.score_point + self.penalty_point + self.yellow_card_point + self.red_card_point + self.own_goal_point
    
    if(self.bet.match.team1 == self.bet.player.team || self.bet.match.team2 == self.bet.player.team)
       self.bonus_team_point = temp_cal_percent*10/100
     else
       self.bonus_team_point = 0
    end
    
    if self.bonus_team_point < 0
      self.bonus_team_point = 0
    end
    
    self.total_point = self.team_winner_point + self.score_point + self.penalty_point + self.yellow_card_point + self.red_card_point + self.own_goal_point + self.bonus_team_point
    
  end
  
end
