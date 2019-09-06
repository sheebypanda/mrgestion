class IntemperiesController < ApplicationController
  before_action :set_intempery, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @intemperies = Intemperie.all
  end

  def show
  end

  def new
    @intempery = Intemperie.new
  end

  def edit
  end

  def create
    @intempery = Intemperie.new(intempery_params)

    respond_to do |format|
      if @intempery.save
        format.html { redirect_to intemperies_path, notice: 'Intemperie ajoutée.' }
        format.json { render :show, status: :created, location: @intempery }
      else
        format.html { render :new }
        format.json { render json: @intempery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @intempery.update(intempery_params)
        format.html { redirect_to intemperies_path, notice: 'Intemperie modifiée.' }
        format.json { render :show, status: :ok, location: @intempery }
      else
        format.html { render :edit }
        format.json { render json: @intempery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @intempery.destroy
    respond_to do |format|
      format.html { redirect_to intemperies_url, notice: 'Intemperie supprimée.' }
      format.json { head :no_content }
    end
  end

private

  def set_intempery
    @intempery = Intemperie.find(params[:id])
  end

  def intempery_params
    params.require(:intemperie).permit(:date, :qte)
  end
end
