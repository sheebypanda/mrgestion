class JourferiesController < ApplicationController
  before_action :set_jourfery, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @jourferies = Jourferie.all
  end

  def show
  end

  def new
    @jourfery = Jourferie.new
  end

  def edit
  end

  def create
    @jourfery = Jourferie.new(jourfery_params)

    respond_to do |format|
      if @jourfery.save
        format.html { redirect_to jourferies_path, notice: 'Jour férié ajouté.' }
        format.json { render :show, status: :created, location: @jourfery }
      else
        format.html { render :new }
        format.json { render json: @jourfery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @jourfery.update(jourfery_params)
        format.html { redirect_to jourferies_path, notice: 'Jour férié modifié.' }
        format.json { render :show, status: :ok, location: @jourfery }
      else
        format.html { render :edit }
        format.json { render json: @jourfery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @jourfery.destroy
    respond_to do |format|
      format.html { redirect_to jourferies_url, notice: 'Jour férié supprimé.' }
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
      params.require(:jourferie).permit(:date)
    end
end
