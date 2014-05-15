class Team < ActiveRecord::Base
  has_many :players
  
  validates :name,:abbreviate , presence: true
  validates :name,:abbreviate , uniqueness: true
  
end
