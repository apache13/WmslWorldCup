class Player < ActiveRecord::Base
  belongs_to :team
  has_many :bets
  
  validates :name , :uid ,:team , presence: true
  validates :name , uniqueness: true
  
end
