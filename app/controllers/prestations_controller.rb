class PrestationsController < ApplicationController
  before_action :set_prestation, only: [:show, :edit, :update, :destroy]

  def index
    @prestations = Prestation.all
  end

  def calendrier
    @prestations = Prestation.all
    @jourferies = Jourferie.all
    @intemperies = Intemperie.all
  end

  def facture    
  end

  def show
  end

  def new
    @prestation = Prestation.new
  end

  def edit
  end

  def create
    @prestation = Prestation.new(prestation_params)
    @prestation.nbjour = @prestation.debut.business_dates_until(@prestation.fin).count + 1

    respond_to do |format|
      if @prestation.save
        format.html { redirect_to prestations_path, notice: 'Prestation créée.' }
        format.json { render :show, status: :created, location: @prestation }
      else
        format.html { render :new }
        format.json { render json: @prestation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    params['prestation']['nbjour'] = params['prestation']['debut'].to_date.business_dates_until(params['prestation']['fin'].to_date).count + 1
    respond_to do |format|
      if @prestation.update(prestation_params)
        format.html { redirect_to prestations_path, notice: 'Prestation modifiée.' }
        format.json { render :show, status: :ok, location: @prestation }
      else
        format.html { render :edit }
        format.json { render json: @prestation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @prestation.destroy
    respond_to do |format|
      format.html { redirect_to prestations_url, notice: 'Prestation supprimée.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestation
      @prestation = Prestation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prestation_params
      params.require(:prestation).permit(:employeur_id, :client_id, :machine_id, :debut, :fin, :nbjour, :hsup, :adresse, :ville)
    end
end
