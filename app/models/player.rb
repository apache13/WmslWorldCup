class Player < ActiveRecord::Base
  belongs_to :team
  has_many :bets
  has_many :calculations
  
  validates :name , :uid ,:team , presence: true
  validates :name , uniqueness: true
  
end
