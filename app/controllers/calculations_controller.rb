class CalculationsController < ApplicationController
  before_action :set_calculation, only: [:show, :edit, :update, :destroy]

  before_action :require_login_permission , :only => [:index,:show]
  before_action :require_admin_permission , :only => [:new,:create,:edit,:update,:destroy]
  
  # GET /calculations
  # GET /calculations.json
  def index
    conditions = {}
    conditions[:player_id] = params[:player] unless params[:player].blank?
    @calculations = Calculation.where(conditions).paginate(:page => params[:page],:per_page => 10)
  end

  # GET /calculations/1
  # GET /calculations/1.json
  def show
    @view_only = true
  end

  # GET /calculations/new
  def new
    @view_only = false
    @calculation = Calculation.new
  end

  # GET /calculations/1/edit
  def edit
    @view_only = false
  end

  # POST /calculations
  # POST /calculations.json
  def create
    @calculation = Calculation.new(calculation_params)
    respond_to do |format|
      if @calculation.save
        format.html { redirect_to @calculation, notice: 'Calculation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @calculation }
      else
        format.html { render action: 'new' }
        format.json { render json: @calculation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calculations/1
  # PATCH/PUT /calculations/1.json
  def update
    respond_to do |format|
      if @calculation.update(calculation_params)
        format.html { redirect_to @calculation, notice: 'Calculation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @calculation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calculations/1
  # DELETE /calculations/1.json
  def destroy
    @calculation.destroy
    respond_to do |format|
      format.html { redirect_to calculations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calculation
      @calculation = Calculation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calculation_params
      params.require(:calculation).permit(:player_id, :bet_id, :total_point, :team_winner_point, :score_point,:penalty_point,:yellow_card_point,:red_card_point,:own_goal_point)
    end
end
