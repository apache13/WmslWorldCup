class Calculation < ActiveRecord::Base  
  
  before_save :calculate
  after_save :link_bet
  
  belongs_to :player
  belongs_to :bet
  
  validates :bet , :player , presence: true
  validates_uniqueness_of :player, :scope => :bet
  
  private
  def link_bet
    self.bet.update(calculation: self)
  end
  
  def calculate
    
    self.team_winner_point = 0
    self.score_point = 0
    
    if(self.bet.match.winner.id == self.bet.winner.id)
      self.team_winner_point = 20
    else
      self.team_winner_point = 0
    end
    
    
    if(self.bet.match.team1_score == self.bet.team1_score)
      self.score_point += 20
    else
      self.score_point += 0
    end
    
    if(self.bet.match.team2_score == self.bet.team2_score)
      self.score_point += 20
    else
      self.score_point += 0
    end
    
    self.total_point = self.team_winner_point + self.score_point
    
  end
  
end
