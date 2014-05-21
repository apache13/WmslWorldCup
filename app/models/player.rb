class Player < ActiveRecord::Base
  
  belongs_to :team
  has_many :bets
  has_many :calculations
  has_many :battles
  
  validates :name , :uid ,:team , presence: true
  validates :name , :uid , uniqueness: true
  
end
