class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  before_action :require_login_permission , :only => [:index,:show]
  before_action :require_admin_permission , :only => [:new,:create,:edit,:update,:destroy]
  
  
  # GET /teams
  # GET /teams.json
  def index

    name = params[:name] unless params[:name].blank?
    if(name.nil?)
      @teams = Team.all.order(:name).paginate(:page => params[:page],:per_page => 10)
    else
      @teams = Team.where(" name like ? ", "%"+name+"%" ).paginate(:page => params[:page],:per_page => 10)
    end
    
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
      @players = player_sort(@team.players)
      @matches = Match.where('team1_id = ? or team2_id = ?',@team,@team).order(match: :asc)
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :abbreviate ,:plyers)
    end
    
end
