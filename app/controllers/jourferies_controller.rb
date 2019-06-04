class JourferiesController < ApplicationController
  before_action :set_jourfery, only: [:show, :edit, :update, :destroy]

  # GET /jourferies
  # GET /jourferies.json
  def index
    @jourferies = Jourferie.all
  end

  # GET /jourferies/1
  # GET /jourferies/1.json
  def show
  end

  # GET /jourferies/new
  def new
    @jourfery = Jourferie.new
  end

  # GET /jourferies/1/edit
  def edit
  end

  # POST /jourferies
  # POST /jourferies.json
  def create
    @jourfery = Jourferie.new(jourfery_params)

    respond_to do |format|
      if @jourfery.save
        format.html { redirect_to @jourfery, notice: 'Jourferie was successfully created.' }
        format.json { render :show, status: :created, location: @jourfery }
      else
        format.html { render :new }
        format.json { render json: @jourfery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jourferies/1
  # PATCH/PUT /jourferies/1.json
  def update
    respond_to do |format|
      if @jourfery.update(jourfery_params)
        format.html { redirect_to @jourfery, notice: 'Jourferie was successfully updated.' }
        format.json { render :show, status: :ok, location: @jourfery }
      else
        format.html { render :edit }
        format.json { render json: @jourfery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jourferies/1
  # DELETE /jourferies/1.json
  def destroy
    @jourfery.destroy
    respond_to do |format|
      format.html { redirect_to jourferies_url, notice: 'Jourferie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jourfery
      @jourfery = Jourferie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jourfery_params
      params.require(:jourfery).permit(:date)
    end
end
