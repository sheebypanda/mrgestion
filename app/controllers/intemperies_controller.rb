class IntemperiesController < ApplicationController
  before_action :set_intempery, only: [:show, :edit, :update, :destroy]

  # GET /intemperies
  # GET /intemperies.json
  def index
    @intemperies = Intemperie.all
  end

  # GET /intemperies/1
  # GET /intemperies/1.json
  def show
  end

  # GET /intemperies/new
  def new
    @intempery = Intemperie.new
  end

  # GET /intemperies/1/edit
  def edit
  end

  # POST /intemperies
  # POST /intemperies.json
  def create
    @intempery = Intemperie.new(intempery_params)

    respond_to do |format|
      if @intempery.save
        format.html { redirect_to @intempery, notice: 'Intemperie was successfully created.' }
        format.json { render :show, status: :created, location: @intempery }
      else
        format.html { render :new }
        format.json { render json: @intempery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intemperies/1
  # PATCH/PUT /intemperies/1.json
  def update
    respond_to do |format|
      if @intempery.update(intempery_params)
        format.html { redirect_to @intempery, notice: 'Intemperie was successfully updated.' }
        format.json { render :show, status: :ok, location: @intempery }
      else
        format.html { render :edit }
        format.json { render json: @intempery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intemperies/1
  # DELETE /intemperies/1.json
  def destroy
    @intempery.destroy
    respond_to do |format|
      format.html { redirect_to intemperies_url, notice: 'Intemperie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intempery
      @intempery = Intemperie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intempery_params
      params.require(:intempery).permit(:date)
    end
end
