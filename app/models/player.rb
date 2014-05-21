class Player < ActiveRecord::Base
  
  before_save :admin_player
  
  belongs_to :team
  has_many :bets
  has_many :calculations
  has_many :battles
  
  validates :name , :uid ,:team , presence: true
  validates :name , :uid , uniqueness: true
  
  private
  def admin_player
    self.admin = ApplicationController.admin?(self.uid)
  end
  
end
