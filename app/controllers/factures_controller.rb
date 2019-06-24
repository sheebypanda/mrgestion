class FacturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_facture, only: [:show, :edit, :update, :destroy]

  def index
    @factures  = Facture.all
  end

  def show
  end

  def new
    @facture = Facture.new
    @prestations_nonfacture = Prestation.includes(:facture_lignes).where('facture_lignes.prestation_id' => ['', nil])
    @facture.prestations.build
  end

  def edit
    @prestations_nonfacture = Prestation.includes(:facture_lignes).where('facture_lignes.prestation_id' => ['', nil])
  end

  def create
    @facture = Facture.new(facture_params)
    respond_to do |format|
      if @facture.save
        params['facture']['prestation_ids'].each do |p|
          if p.present?
            fl = FactureLigne.new
            fl.prestation_id = p
            fl.facture_id = @facture.id
            fl.debut = @facture.debut
            fl.fin = @facture.fin
            fl.save!
          end
        end
        format.html { redirect_to factures_path, notice: 'Facture ajoutée.'}
      end
    end
  end

  def update
    respond_to do |format|
      if @facture.update(facture_params)
        format.html { redirect_to factures_path, notice: 'Facture modifiée.'}
        if @facture.save
          params['facture']['prestation_ids'].each do |p|
            if p.present?
              fl = FactureLigne.new
              fl.prestation_id = p
              fl.facture_id = @facture.id
              fl.debut = @facture.debut
              fl.fin = @facture.fin
              fl.save!
            end
          end
          format.html { redirect_to factures_path, notice: 'Facture ajoutée.'}
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
      @facture  = Facture.find(params[:id])
    end

    def facture_params
      params.require(:facture).permit(:employeur_id, :numero, :debut, :fin)
    end

end
