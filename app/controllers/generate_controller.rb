class GenerateController < ApplicationController

  before_filter :require_admin_permission
  
  def bets
    match = Match.find(params[:match])
    players = Player.all
    calculation_config = CalculationConfig.find(1)

    players.each do |player|
      if Bet.exists?(match: match , player: player)
        logger.debug 'skip generate bet'
      else
        logger.debug 'generate bet'
        bet = Bet.new(match: match , player: player , calculation_config: calculation_config )
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

    battles = Battle.where(match: match)
    battles.each do |battle|
      battle.calculate
      battle.save
    end
    
    
  end

  def battles

    match = Match.find(params[:match])
    
    Battle.destroy_all(match: match)
    
    players = Player.all
    players = players.shuffle

    players.each_slice(2) do |player1,player2|
      battle = Battle.new(match: match,player1: player1,player2: player2)
      battle.save
    end

    @battles = Battle.where(match: match)

  end

end
