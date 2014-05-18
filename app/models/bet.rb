class Bet < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  belongs_to :winner , :class_name => "Team" , :foreign_key => 'winner_id'
  belongs_to :calculation
  
  validates_uniqueness_of :match, :scope => :player
  
end
