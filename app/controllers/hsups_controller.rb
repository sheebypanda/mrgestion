class HsupsController < ApplicationController
  before_action :set_hsup, only: [:show, :edit, :update, :destroy]
  before_action :get_today_prestations, :get_all_prestations, only: [:new, :edit]

  def index
    @hsups = Hsup.all
  end

  def show
  end

  def new
    @hsup = Hsup.new
  end

  def edit
  end

  def create
    @hsup = Hsup.new(hsup_params)

    respond_to do |format|
      if @hsup.save
        format.html { redirect_to hsups_url, notice: 'Hsup créée.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @hsup.update(hsup_params)
        format.html { redirect_to hsups_url, notice: 'Hsup mise à jour.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @hsup.destroy
    respond_to do |format|
      format.html { redirect_to hsups_url, notice: 'Hsup détruite.' }
    end
  end

  private
    def set_hsup
      @hsup = Hsup.find(params[:id])
    end

    def hsup_params
      params.require(:hsup).permit(:qte, :date, :prestation_id)
    end

    def get_today_prestations
      @today_prestations = Prestation.where('debut <= ? AND fin >= ?', Date.today, Date.today)
    end

    def get_all_prestations
      @all_prestations = Prestation.all.order(fin: :desc)
    end
end
