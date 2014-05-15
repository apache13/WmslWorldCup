class Player < ActiveRecord::Base
  belongs_to :team
  
  validates :name , :uid ,:team , presence: true
  validates :name , uniqueness: true
  
end
