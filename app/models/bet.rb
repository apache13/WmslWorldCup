class Bet < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  belongs_to :calculation
  belongs_to :calculation_config
  
  validates :player , :match , :calculation_config , presence: true
  validates_uniqueness_of :match, :scope => :player
  
  validates :result , presence: true , :on => :update
  validates :team1_score , :team2_score , numericality: { only_integer: true , greater_than_or_equal_to: 0 , less_than: 100 } , :on => :update
  
end
