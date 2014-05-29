class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy]

  before_filter :require_login_permission , :only => [:index,:show,:edit,:update]
  before_filter :require_admin_permission , :only => [:new,:create,:destroy]
  # GET /bets
  # GET /bets.json
  def index
    if current_user.admin?
        @bets = Bet.all
    else
      if current_user.player.nil?
        @bets = Bet.joins(:match).where("matches.closed = ? ",false).order('matches.match')
      else
        @bets = Bet.where(player: current_user.player)
      end
    end

  end

  # GET /bets/1
  # GET /bets/1.json
  def show
  end

  # GET /bets/new
  def new
    @bet = Bet.new
  end

  # GET /bets/1/edit
  def edit
    if !(current_user.admin? || @bet.player.user == current_user)
      redirect_to({ action: 'access_denied' , :controller=>"main"})
    end
  end

  # POST /bets
  # POST /bets.json
  def create
    @bet = Bet.new(bet_params)

    respond_to do |format|
      if @bet.save
        format.html { redirect_to @bet, notice: 'Bet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bet }
      else
        format.html { render action: 'new' }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    respond_to do |format|

      if @bet.match.closed == true
        format.html { redirect_to @bet, notice: "Can't update because match is closed." }
        format.json { head :no_content }
      else
        if @bet.update(bet_params)
          format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @bet.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bet
    @bet = Bet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bet_params
    params.require(:bet).permit(:match_id, :player_id, :winner_id ,:team1_score, :team2_score , :calculation_id,:result)
  end
end
