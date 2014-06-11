class BattlesController < ApplicationController
  before_action :set_battle, only: [:show, :edit, :update, :destroy]

  before_filter :require_login_permission , :only => [:index,:show]
  before_filter :require_admin_permission , :only => [:new,:create,:edit,:update,:destroy]
  # GET /battles
  # GET /battles.json
  def index
    @battles = Battle.all

    @battles.each do |battle|
      bet1 = Bet.where(player: battle.player1,match: battle.match).first
      bet2 = Bet.where(player: battle.player2,match: battle.match).first
      calculation1 = Calculation.where(player: battle.player1, bet: bet1).first
      calculation2 = Calculation.where(player: battle.player2, bet: bet2).first
      battle.calculation1 = calculation1
      battle.calculation2 = calculation2
    end

  end

  # GET /battles/1
  # GET /battles/1.json
  def show
  end

  # GET /battles/new
  def new
    @battle = Battle.new
  end

  # GET /battles/1/edit
  def edit
  end

  # POST /battles
  # POST /battles.json
  def create
    @battle = Battle.new(battle_params)

    respond_to do |format|
      if @battle.save
        format.html { redirect_to @battle, notice: 'Battle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @battle }
      else
        format.html { render action: 'new' }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /battles/1
  # PATCH/PUT /battles/1.json
  def update
    respond_to do |format|
      if @battle.update(battle_params)
        format.html { redirect_to @battle, notice: 'Battle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battles/1
  # DELETE /battles/1.json
  def destroy
    @battle.destroy
    respond_to do |format|
      format.html { redirect_to battles_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_battle
    @battle = Battle.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def battle_params
    params.require(:battle).permit(:match_id, :player1_id, :player2_id, :result)
  end
end
