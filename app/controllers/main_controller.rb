class MainController < ApplicationController

  before_action :require_login_permission , :except => [:login]
  def login

  end

  def index

    players = Player.all.order(:id)
    @players = player_sort(players)

    @matches_close = Match.where(:closed => true).order(match: :desc).limit(5)
    @matches_open = Match.where(:closed => false).order(match: :asc).limit(5)
    @bets = Bet.joins(:match).where("player_id = ? and matches.closed = ? ",current_user.player,false).order("datetime(matches.match) ASC")

    @total_pay = 0
    @players.each do |player|
      @total_pay += player.total_pay
    end

    @notifications = Notification.all.order(id: :desc).limit(3)
    
  end

  def my_bets

    @bets = Bet.joins(:match).where("player_id = ? ",current_user.player).order("datetime(matches.match) ASC")

    respond_to do |format|
      format.html
      format.pdf {
        html = render_to_string(:layout => false , :action => "my_bets", :formats => :html)
        kit = PDFKit.new(html)
        send_data(kit.to_pdf, :filename => "MyBets.pdf", :type => 'application/pdf')
        return # to avoid double render call
      }
    end
  end
  
  def access_denied

  end
end
