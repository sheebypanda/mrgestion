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
  end

  def edit
  end

  def create
    @facture = Facture.new(facture_params)

    respond_to do |format|
      if @facture.save
        format.html { redirect_to factures_path, notice: 'Facture ajoutée.'}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @facture.update(facture_params)
        format.html { redirect_to factures_path, notice: 'Facture modifiée.'}
      else
        format.html { render :edit }
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
