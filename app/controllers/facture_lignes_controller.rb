class FactureLignesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_facture_ligne, only: [:edit, :destroy]

  def destroy
    @facture_ligne.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Prestation supprimée de la facture.'}
      format.json { head :no_content }
    end
  end

  private

    def set_facture_ligne
      @facture_ligne  = FactureLigne.find(params[:id])
    end
end
