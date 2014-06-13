module ApplicationHelper
  def facebook_image_tag(player)
    if(player != nil)
      link_to player do
        image_tag 'https://graph.facebook.com/'+player.uid+'/picture' ,:class => 'img-rounded' , height: '30', width: '30' , :title => player.name
      end
    end

  end

  def facebook_thumbnail_image_tag(player,type)
    if(player != nil)
      image_tag 'https://graph.facebook.com/'+player.uid+'/picture?type='+type ,:class => 'img-thumbnail'
    end
  end

  def flag_image_tag(team)
    if(team != nil)
      link_to(image_tag('/flag/'+team.abbreviate+'.png' ,:class => "img-rounded" , :title => team.name),team)
    end
  end

  def match_image_tag(match)
    if(match != nil)
      flag_image_tag(match.team1) +' VS '+ flag_image_tag(match.team2)
    end
  end

  def match_result_flat_image_tag(result,match)
    if result == 1
      flag_image_tag(match.team1)
    else
      if result == 2
        flag_image_tag(match.team2)
      else
        if result.nil?
          return "-"
        else
          return "Draw"
        end

      end
    end
  end

  def battle_result_facebook_image_tag(result,battle)
    if result == 1
      facebook_image_tag(battle.player1)
    else
      if result == 2
        facebook_image_tag(battle.player2)
      else
        if result.nil?
          return "-"
        else
          return "Draw"
        end

      end
    end
  end

  def live_image_tag(channel)
    image_tag("/"+channel+".png", height: '20', width: '20')
  end

end
