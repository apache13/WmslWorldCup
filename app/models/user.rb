class User < ActiveRecord::Base
  
  belongs_to :player
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.link = auth.extra.link
      
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      
      user.player = Player.find_by_uid(auth.uid)
      
      user.save!
    end
  end
  
  def admin?
    return ApplicationController.admin?(self.uid)
  end
  
  
end
