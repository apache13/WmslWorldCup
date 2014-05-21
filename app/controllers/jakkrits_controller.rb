class JakkritsController < ApplicationController
  before_action :set_jakkrit, only: [:show, :edit, :update, :destroy]

  # GET /jakkrits
  # GET /jakkrits.json
  def index
    @jakkrits = Jakkrit.all
  end

  # GET /jakkrits/1
  # GET /jakkrits/1.json
  def show
  end

  # GET /jakkrits/new
  def new
    @jakkrit = Jakkrit.new
  end

  # GET /jakkrits/1/edit
  def edit
  end

  # POST /jakkrits
  # POST /jakkrits.json
  def create
    @jakkrit = Jakkrit.new(jakkrit_params)

    respond_to do |format|
      if @jakkrit.save
        format.html { redirect_to @jakkrit, notice: 'Jakkrit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @jakkrit }
      else
        format.html { render action: 'new' }
        format.json { render json: @jakkrit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jakkrits/1
  # PATCH/PUT /jakkrits/1.json
  def update
    respond_to do |format|
      if @jakkrit.update(jakkrit_params)
        format.html { redirect_to @jakkrit, notice: 'Jakkrit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @jakkrit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jakkrits/1
  # DELETE /jakkrits/1.json
  def destroy
    @jakkrit.destroy
    respond_to do |format|
      format.html { redirect_to jakkrits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jakkrit
      @jakkrit = Jakkrit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jakkrit_params
      params.require(:jakkrit).permit(:name, :age)
    end
end
