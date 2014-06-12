class Battle < ActiveRecord::Base
  belongs_to :match
  belongs_to :player1 , :class_name => "Player" , :foreign_key => 'player1_id'
  belongs_to :player2 , :class_name => "Player" , :foreign_key => 'player2_id'

  validates_uniqueness_of :match, :scope => [:player1,:player2]
  
  def calculate
      bet1 = Bet.where(player: self.player1,match: self.match).first
      bet2 = Bet.where(player: self.player2,match: self.match).first
      calculation1 = Calculation.where(player: self.player1, bet: bet1).first
      calculation2 = Calculation.where(player: self.player2, bet: bet2).first
      
      self.player1_total_point = calculation1.total_point
      self.player2_total_point = calculation2.total_point
      
      if self.player1_total_point > self.player2_total_point
        self.result = 1
      else
        if self.player1_total_point < self.player2_total_point
          self.result = 2
        else
          self.result = 0
        end
      end
      
      
  end
  
end
