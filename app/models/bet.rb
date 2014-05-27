class Bet < ActiveRecord::Base
  belongs_to :player
  belongs_to :match
  belongs_to :calculation
  
  validates :player , :match , presence: true
  validates_uniqueness_of :match, :scope => :player
  
end
