module ApplicationHelper
  
  def facebook_image_tag(player)
    if(player != nil)
      image_tag 'https://graph.facebook.com/'+player.uid+'/picture' ,:class => 'img-circle'
    end
  end
  
  def facebook_thumbnail_image_tag(player,type)
    if(player != nil)
      image_tag 'https://graph.facebook.com/'+player.uid+'/picture?type='+type ,:class => 'img-thumbnail'
    end
  end
  
  def flag_image_tag(team)
    if(team != nil)
      image_tag '/flag/'+team.abbreviate+'.png' ,:class => "img-rounded"
    end
  end

  def match_image_tag(match)
    if(match != nil)
      flag_image_tag(match.team1) +' VS '+ flag_image_tag(match.team2)
    end
  end

end
