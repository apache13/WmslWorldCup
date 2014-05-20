class Match < ActiveRecord::Base
  belongs_to :winner , :class_name => "Team" , :foreign_key => 'winner_id'
  belongs_to :team1 , :class_name => "Team" , :foreign_key => 'team1_id'
  belongs_to :team2 , :class_name => "Team" , :foreign_key => 'team2_id'
  has_many :bets
  has_many :battles

  validates :match ,:team1 ,:team2 , presence: true
  
end
