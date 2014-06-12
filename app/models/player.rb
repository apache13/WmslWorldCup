class Player < ActiveRecord::Base
  
  belongs_to :team
  has_many :bets
  has_many :calculations
  has_many :battles
  
  validates :name , :uid ,:team , presence: true
  validates :name , :uid , uniqueness: true

  validates :name, length: { maximum: 32 }
  
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
  
  def pp
    pp = 0
    self.calculations.each do |calculation|
      pp += calculation.penalty_point
    end
    return pp
  end
  
  def ycp
    ycp = 0
    self.calculations.each do |calculation|
      ycp += calculation.yellow_card_point
    end
    return ycp
  end
  
  def rcp
    rcp = 0
    self.calculations.each do |calculation|
      rcp += calculation.red_card_point
    end
    return rcp
  end
  
  def ogp
    ogp = 0
    self.calculations.each do |calculation|
      ogp += calculation.own_goal_point
    end
    return ogp
  end
  
  def btp
    btp = 0
    self.calculations.each do |calculation|
      btp += calculation.bonus_team_point
    end
    return btp
  end
  
  def pts
    pts = 0
    self.calculations.each do |calculation|
      pts += calculation.total_point
    end
    return pts
  end
  
  def lpts
    lpts = 0
    
    @battles1 = Battle.joins(:match).where('matches.closed = ? and player1_id = ?',true,self)
    @battles1.each do |battle|
      if battle.result == 0
        lpts += 1
      else
        if battle.result == 1
          lpts += 3
        end
      end
    end
    
    @battles2 = Battle.joins(:match).where('matches.closed = ? and player2_id = ?',true,self)
    @battles2.each do |battle|
      if battle.result == 0
        lpts += 1
      else
        if battle.result == 2
          lpts += 3
        end
      end
    end
    
    return lpts
    
  end
  
end
