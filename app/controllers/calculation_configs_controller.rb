class CalculationConfigsController < ApplicationController
  before_action :set_calculation_config, only: [:show, :edit, :update, :destroy]
  
  before_filter :require_admin_permission
  
  # GET /calculation_configs
  # GET /calculation_configs.json
  def index
    @calculation_configs = CalculationConfig.all
  end

  # GET /calculation_configs/1
  # GET /calculation_configs/1.json
  def show
  end

  # GET /calculation_configs/new
  def new
    @calculation_config = CalculationConfig.new
  end

  # GET /calculation_configs/1/edit
  def edit
  end

  # POST /calculation_configs
  # POST /calculation_configs.json
  def create
    @calculation_config = CalculationConfig.new(calculation_config_params)

    respond_to do |format|
      if @calculation_config.save
        format.html { redirect_to @calculation_config, notice: 'Calculation config was successfully created.' }
        format.json { render action: 'show', status: :created, location: @calculation_config }
      else
        format.html { render action: 'new' }
        format.json { render json: @calculation_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calculation_configs/1
  # PATCH/PUT /calculation_configs/1.json
  def update
    respond_to do |format|
      if @calculation_config.update(calculation_config_params)
        format.html { redirect_to @calculation_config, notice: 'Calculation config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @calculation_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calculation_configs/1
  # DELETE /calculation_configs/1.json
  def destroy
    @calculation_config.destroy
    respond_to do |format|
      format.html { redirect_to calculation_configs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calculation_config
      @calculation_config = CalculationConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calculation_config_params
      params.require(:calculation_config).permit(:team_winner_multiply, :score_multiply, :penalty_multiply, :yellow_card_multiply, :red_card_multiply, :own_goal_multiply, :bonus_team_multiply )
    end
end
