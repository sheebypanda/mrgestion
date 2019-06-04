class EmployeursController < ApplicationController
  before_action :set_employeur, only: [:show, :edit, :update, :destroy]

  # GET /employeurs
  # GET /employeurs.json
  def index
    @employeurs = Employeur.all
  end

  # GET /employeurs/1
  # GET /employeurs/1.json
  def show
  end

  # GET /employeurs/new
  def new
    @employeur = Employeur.new
  end

  # GET /employeurs/1/edit
  def edit
  end

  # POST /employeurs
  # POST /employeurs.json
  def create
    @employeur = Employeur.new(employeur_params)

    respond_to do |format|
      if @employeur.save
        format.html { redirect_to @employeur, notice: 'Employeur was successfully created.' }
        format.json { render :show, status: :created, location: @employeur }
      else
        format.html { render :new }
        format.json { render json: @employeur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employeurs/1
  # PATCH/PUT /employeurs/1.json
  def update
    respond_to do |format|
      if @employeur.update(employeur_params)
        format.html { redirect_to @employeur, notice: 'Employeur was successfully updated.' }
        format.json { render :show, status: :ok, location: @employeur }
      else
        format.html { render :edit }
        format.json { render json: @employeur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employeurs/1
  # DELETE /employeurs/1.json
  def destroy
    @employeur.destroy
    respond_to do |format|
      format.html { redirect_to employeurs_url, notice: 'Employeur was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employeur
      @employeur = Employeur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employeur_params
      params.require(:employeur).permit(:nom, :siret, :adresse, :cp, :ville, :tel, :email, :email2)
    end
end
