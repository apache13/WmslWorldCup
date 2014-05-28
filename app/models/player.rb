class Player < ActiveRecord::Base
  
  belongs_to :team
  has_many :bets
  has_many :calculations
  has_many :battles
  
  validates :name , :uid ,:team , presence: true
  validates :name , :uid , uniqueness: true

  def user
    return User.find_by_uid(self.uid)
  end
  
  def played
    return self.calculations.count
  end
  
  def twp
    twp = 0
    self.calculations.each do |calculation|
      twp += calculation.team_winner_point
    end
    return twp
  end
  
  def sp
    sp = 0
    self.calculations.each do |calculation|
      sp += calculation.score_point
    end
    return sp
  end
  
  def pts
    pts = 0
    self.calculations.each do |calculation|
      pts += calculation.total_point
    end
    return pts
  end
  
end
