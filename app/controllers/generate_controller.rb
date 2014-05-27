class GenerateController < ApplicationController

  before_filter :require_admin_permission
  def bets
    match = Match.find(params[:match])
    players = Player.all
    players.each do |player|
      if Bet.exists?(match: match , player: player)
        logger.debug 'skip generate bet'
      else
        logger.debug 'generate bet'
        bet = Bet.new(match: match , player: player)
      bet.save
      end
    end
    @bets = Bet.where(match: match)
  end

  def calculate
    match = Match.find(params[:match])
    bets = Bet.where(match: match)
    bets.each do |bet|
      if Calculation.exists?(player: bet.player , bet: bet)
        logger.debug 're-calculation'
        calculation = Calculation.where(player: bet.player , bet: bet).first
      calculation.calculate
      calculation.save
      else
        logger.debug 'new-calculation'
        calculation = Calculation.new(player: bet.player , bet: bet)
      calculation.calculate
      calculation.save
      end
    end
    @calculations = Calculation.joins(bet: :match).where('matches.id'=>match)
  end

end
