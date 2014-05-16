class Match < ActiveRecord::Base
  belongs_to :team1 , :class_name => "Team" , :foreign_key => 'team1_id'
  belongs_to :team2 , :class_name => "Team" , :foreign_key => 'team2_id'
  has_many :bets

  validates :match ,:team1 ,:team2 , presence: true
  
end
