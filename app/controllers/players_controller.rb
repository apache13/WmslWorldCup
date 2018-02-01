class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  before_action :require_login_permission , :only => [:index,:show,:new,:create,:edit,:update]
  before_action :require_admin_permission , :only => [:destroy]
  # GET /players
  # GET /players.json
  def index
    
    name = params[:name] unless params[:name].blank?
    if(name.nil?)
      @players = Player.all.paginate(:page => params[:page],:per_page => 10)
    else
      @players = Player.where(" name like ? ", "%"+name+"%" ).paginate(:page => params[:page],:per_page => 10)
    end
    
    @players.each do |player|
      player.calculate
    end
    
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @player.calculate
    @bets = Bet.joins(:match).where(player: @player).order('matches.match desc').paginate(:page => params[:page],:per_page => 10)
    @battles = Battle.joins(:match).where('player1_id = ? or player2_id = ?' ,@player,@player).order('matches.match desc').paginate(:page => params[:page],:per_page => 10)
    
    calculations = Calculation.where(player: @player)
    @cal_count = 0
    @cal_result_currect = 0
    @cal_score_currect = 0
    @cal_penalty_currect = 0
    @cal_yellow_card_currect = 0
    @cal_red_card_currect = 0
    @cal_own_goal_current = 0

    calculations.each do |cal|
      @cal_count += 1
      
      if cal.team_winner_point != 0
        @cal_result_currect += 1
      end
      
      if cal.score_point != 0
        @cal_score_currect += 1
      end
      
      if cal.penalty_point != 0
        @cal_penalty_currect += 1
      end
      
      if cal.yellow_card_point != 0
        @cal_yellow_card_currect += 1
      end
      
      if cal.red_card_point != 0
        @cal_red_card_currect += 1
      end
      
      if cal.own_goal_point != 0
        @cal_own_goal_current += 1
      end
      
    end
      
    @cal_result_currect = @cal_result_currect*100/@cal_count
    @cal_score_currect = @cal_score_currect*100/@cal_count
    @cal_penalty_currect = @cal_penalty_currect*100/@cal_count
    @cal_yellow_card_currect = @cal_yellow_card_currect*100/@cal_count
    @cal_red_card_currect = @cal_red_card_currect*100/@cal_count
    @cal_own_goal_current = @cal_own_goal_current*100/@cal_count
    
  end
  

  # GET /players/new
  def new
    if ApplicationController.register_new_player?
      @player = Player.new
      @player.uid = current_user.uid
    else
      redirect_to({ action: 'access_denied' , :controller=>"main"})
    end
  end

  # GET /players/1/edit
  def edit
    
    if current_user.admin?
      # pass
    else
      if @player.user == current_user
        if ApplicationController.player_edit_profile?
          # pass
        else
          redirect_to({ action: 'access_denied' , :controller=>"main"})
        end
      else
        redirect_to({ action: 'access_denied' , :controller=>"main"})
      end
    end
    
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)
    @player.uid = current_user.uid

    respond_to do |format|
      if @player.save

        current_user.player = @player
        current_user.save

        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render action: 'show', status: :created, location: @player }
      else
        format.html { render action: 'new' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|

      if current_user.admin? || @player.user == current_user
        if @player.update(player_params)
          format.html { redirect_to @player, notice: 'Player was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @player.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to({ action: 'access_denied' , :controller=>"main"}) }
      end

    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def player_params
    params.require(:player).permit(:name, :uid ,:team_id,:user_id)
  end

end
