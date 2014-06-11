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
  
  private
  def random_bet
    
    Random.new_seed 
    
    self.bet.result = rand(3) # 0,1,2
    self.bet.team1_score = rand(10) # 0-9
    self.bet.team2_score = rand(10) # 0-9
    
    self.bet.penalty = rand(2) == 1 ? true : false
    self.bet.yellow_card = rand(2) == 1 ? true : false
    self.bet.red_card = rand(2) == 1 ? true : false
    self.bet.own_goal = rand(2) == 1 ? true : false

  end  
  
  public
  def calculate
    
    #initial variable
    self.team_winner_point = 0
    self.score_point = 0
    self.penalty_point = 0
    self.yellow_card_point = 0
    self.red_card_point = 0  
    self.own_goal_point = 0
    self.bonus_team_point = 0
    self.total_point = 0
    
    if self.bet.result.nil?
      random_bet
    end 
    
    if(self.bet.match.result == self.bet.result)
      self.team_winner_point = self.bet.calculation_config.team_winner_multiply
    else
      self.team_winner_point = 0
    end
    
    if(self.bet.match.team1_score == self.bet.team1_score)
      self.score_point += self.bet.calculation_config.score_multiply
    else
      self.score_point += 0
    end
    
    if(self.bet.match.team2_score == self.bet.team2_score)
      self.score_point += self.bet.calculation_config.score_multiply
    else
      self.score_point += 0
    end
    
    if(self.bet.match.penalty == self.bet.penalty)
      self.penalty_point += self.bet.calculation_config.penalty_multiply
    else
      self.penalty_point += 0
    end
    
    if(self.bet.match.yellow_card == self.bet.yellow_card)
      self.yellow_card_point += self.bet.calculation_config.yellow_card_multiply
    else
      self.yellow_card_point += 0
    end
    
    if(self.bet.match.red_card == self.bet.red_card)
      self.red_card_point += self.bet.calculation_config.red_card_multiply
    else
      self.red_card_point += 0
    end
    
    if(self.bet.match.own_goal == self.bet.own_goal)
      self.own_goal_point += self.bet.calculation_config.own_goal_multiply
    else
      self.own_goal_point += 0
    end
    
    temp_cal_percent = self.team_winner_point + self.score_point + self.penalty_point + self.yellow_card_point + self.red_card_point + self.own_goal_point
    
    if(self.bet.match.team1 == self.bet.player.team || self.bet.match.team2 == self.bet.player.team)
       self.bonus_team_point = temp_cal_percent*self.bet.calculation_config.bonus_team_multiply/100
    end
    
    self.total_point = self.team_winner_point + self.score_point + self.penalty_point + self.yellow_card_point + self.red_card_point + self.own_goal_point + self.bonus_team_point
    
  end
  
end
