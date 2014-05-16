module ApplicationHelper
  
  def facebook_image_tag(uid)
      image_tag 'https://graph.facebook.com/'+uid+'/picture' ,:class => 'img-circle'
  end
  
  def flag_image_tag(abbreviate)
      image_tag '/flag/'+abbreviate+'.png' ,:class => "img-rounded"
  end
  
  def match_image_tag(match)
      flag_image_tag(match.team1.abbreviate) +' VS '+ flag_image_tag(match.team2.abbreviate)
  end
  
end
