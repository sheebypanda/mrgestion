class FactureLignesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_facture_ligne, only: [:edit, :destroy]

  def index
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
    @facture_ligne.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: "/factures/#{@facture_ligne.facture}/edit", notice: 'Prestation supprimée de la facture.'}
      format.json { head :no_content }
    end
  end

  private

    def set_facture_ligne
      @facture_ligne  = FactureLigne.find(params[:id])
    end
end
