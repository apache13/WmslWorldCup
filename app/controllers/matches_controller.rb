class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  before_action :require_login_permission , :only => [:index,:show]
  before_action :require_admin_permission , :only => [:new,:create,:edit,:update,:destroy]
  # GET /matches
  # GET /matches.json
  def index

    conditions = {}
    unless params[:closed].blank?
      if params[:closed] == 'true'
        conditions[:closed] = true
      else
        conditions[:closed] = false
      end
    end
    conditions[:team1_id] = params[:team1_id] unless params[:team1_id].blank?
    conditions[:team2_id] = params[:team2_id] unless params[:team2_id].blank?

    order_by = 'desc'
    unless params[:order_by].blank?
      if params[:order_by] == 'desc'
        order_by = 'desc'
      else
        if params[:order_by] == 'asc'
          order_by = 'asc'
        end
      end
    end
    
    @matches = Match.where(conditions).order("datetime(matches.match) #{order_by} , matches.id desc ").paginate(:page => params[:page],:per_page => 10)

  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @view_only = true
    @table = Bet.joins(:calculation).where(:match=>@match).order('calculations.total_point desc , calculations.total_point desc , calculations.team_winner_point desc , calculations.score_point , calculations.penalty_point desc , calculations.yellow_card_point desc , calculations.red_card_point desc , calculations.own_goal_point desc, calculations.bonus_team_point desc , player_id')

    @bets = 0
    @draw = 0
    @team1_winner = 0
    @team2_winner = 0
    @team1_score = 0
    @team2_score = 0
    
    @match.bets.each do |bet|
      if !bet.result.nil?
        @bets += 1
        @team1_score += bet.team1_score
        @team2_score += bet.team2_score
        if bet.result == 0
          @draw += 1
        else
          if bet.result == 1
            @team1_winner += 1
          else
            @team2_winner += 1
          end
        end
      end
    end
    
    
  end

  # GET /matches/new
  def new
    @view_only = false
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
    @view_only = false
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render action: 'show', status: :created, location: @match }
      else
        format.html { render action: 'new' }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_match
    @match = Match.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def match_params
    params.require(:match).permit(:description , :match, :team1_id, :team2_id, :team1_score, :team2_score, :closed ,:live,:result,:penalty,:yellow_card,:red_card,:own_goal)
  end
end
