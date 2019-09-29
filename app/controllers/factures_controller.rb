class FacturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_facture, only: [:show, :edit, :update, :destroy, :show]

  def index
    @factures = Facture.all.order(debut: 'desc')
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "MR-Facture#{@facture.id}",   # Excluding ".pdf" extension.
        template: "factures/show.html.erb",
        layout: 'pdf.html'#,
        #viewport_size: '1280x1024'
      end
    end
  end

  def new
    @facture = Facture.new
    @prestations_nonfacture = Prestation.includes(:facture_lignes).where('facture_lignes.prestation_id' => ['', nil])
    @prestations_nonfacture = Prestation.all
    @facture.prestations.build
    @facture.facture_lignes.build
  end

  def edit
    @prestations_nonfacture = Prestation.includes(:facture_lignes).where('facture_lignes.prestation_id' => ['', nil])
  end

  def create
    @facture = Facture.new(facture_params)
    respond_to do |format|
      if @facture.save
        format.html do
          redirect_to edit_facture_path(@facture)
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @facture.update(facture_params)
        if @facture.save
          format.html { redirect_back fallback_location: "/factures/#{@facture.id}/edit", notice: 'Prestation ajoutée à la facture.'}
        end
      end
    end
  end

  def destroy
    @facture.destroy
    respond_to do |format|
      format.html { redirect_to factures_path, notice: 'Facture supprimée.'}
    end
  end

private

  def set_facture
    @facture = Facture.find(params[:id])
  end

  def facture_params
    params.require(:facture).permit(:employeur_id, :numero, :debut, :fin, prestation_ids: [], facture_lignes_attributes: [:id, :debut, :fin, :qte, :km, :hsup, :montant])
  end

end
