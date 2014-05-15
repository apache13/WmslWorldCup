class Team < ActiveRecord::Base
  has_many :players
  
  has_many :matches
  
  validates :name,:abbreviate , presence: true
  validates :name,:abbreviate , uniqueness: true
  
end
