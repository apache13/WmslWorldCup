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
  
  attr_accessor :played
  attr_accessor :twp
  attr_accessor :sp
  attr_accessor :pp
  attr_accessor :ycp
  attr_accessor :rcp
  attr_accessor :ogp
  attr_accessor :btp
  attr_accessor :pts
  
  attr_accessor :win
  attr_accessor :draw
  attr_accessor :loss
  
  attr_accessor :lpts
  
  attr_accessor :pts_pos
  attr_accessor :lpts_pos
  
  attr_accessor :pts_pay
  attr_accessor :lpts_pay
  attr_accessor :total_pay
  
  def calculate
    cal_played
    cal_twp
    cal_sp
    cal_pp
    cal_ycp
    cal_rcp
    cal_ogp
    cal_pts
    cal_lpts
  end
  
  private
  def cal_played
    self.played = self.calculations.count
  end
  
  def cal_twp
    twp = 0
    self.calculations.each do |calculation|
      twp += calculation.team_winner_point
    end
    self.twp = twp
  end
  
  def cal_sp
    sp = 0
    self.calculations.each do |calculation|
      sp += calculation.score_point
    end
    self.sp = sp
  end
  
  def cal_pp
    pp = 0
    self.calculations.each do |calculation|
      pp += calculation.penalty_point
    end
    self.pp = pp
  end
  
  def cal_ycp
    ycp = 0
    self.calculations.each do |calculation|
      ycp += calculation.yellow_card_point
    end
    self.ycp = ycp
  end
  
  def cal_rcp
    rcp = 0
    self.calculations.each do |calculation|
      rcp += calculation.red_card_point
    end
    self.rcp = rcp
  end
  
  def cal_ogp
    ogp = 0
    self.calculations.each do |calculation|
      ogp += calculation.own_goal_point
    end
    self.ogp = ogp
  end
  
  def cal_btp
    btp = 0
    self.calculations.each do |calculation|
      btp += calculation.bonus_team_point
    end
    self.btp = btp
  end
  
  def cal_pts
    pts = 0
    self.calculations.each do |calculation|
      pts += calculation.total_point
    end
    self.pts = pts
  end
  
  def cal_lpts
    
    lpts = 0
    win = 0
    draw = 0
    loss = 0
    
    @battles1 = Battle.joins(:match).where('matches.closed = ? and player1_id = ?',true,self)
    @battles1.each do |battle|
      if battle.result == 0
        lpts += 1
        draw += 1
      else
        if battle.result == 1
          lpts += 3
          win += 1
        else
          if battle.result == 2
            loss += 1
          end
        end
      end
    end
    
    @battles2 = Battle.joins(:match).where('matches.closed = ? and player2_id = ?',true,self)
    @battles2.each do |battle|
      if battle.result == 0
        lpts += 1
        draw += 1
      else
        if battle.result == 2
          lpts += 3
          win += 1
        else
          if battle.result == 1
            loss += 1
          end
        end
      end
    end
    
    self.win = win
    self.draw = draw
    self.loss = loss
    self.lpts = lpts
    
  end
  
  
end
