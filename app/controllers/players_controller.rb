class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  before_filter :require_login_permission , :only => [:index,:show,:new,:create,:edit,:update]
  before_filter :require_admin_permission , :only => [:destroy]
  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @bets = Bet.where(player: @player).paginate(:page => params[:page],:per_page => 10)
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
