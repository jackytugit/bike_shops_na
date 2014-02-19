class BikestoresController < ApplicationController
  before_action :set_bikestore, only: [:show, :edit, :update, :destroy]

  # GET /bikestores
  # GET /bikestores.json
  def index
    @bikestores = Bikestore.paginate(:page =>  params[:page], :per_page => 10)
    @hash = Gmaps4rails.build_markers(@bikestores) do |bikestore, marker|
        marker.lat bikestore.latitude
        marker.lng bikestore.longitude
        marker.title bikestore.name
        marker.infowindow bikestore.name + ' <br>' + bikestore.address
    end
  end

  # GET /bikestores/1
  # GET /bikestores/1.json
  def show
  end

  # GET /bikestores/new
  def new
    @bikestore = Bikestore.new
  end

  # GET /bikestores/1/edit
  def edit
  end

  # POST /bikestores
  # POST /bikestores.json
  def create
    @bikestore = Bikestore.new(bikestore_params)

    respond_to do |format|
      if @bikestore.save
        format.html { redirect_to @bikestore, notice: 'Bikestore was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bikestore }
      else
        format.html { render action: 'new' }
        format.json { render json: @bikestore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bikestores/1
  # PATCH/PUT /bikestores/1.json
  def update
    respond_to do |format|
      if @bikestore.update(bikestore_params)
        format.html { redirect_to @bikestore, notice: 'Bikestore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bikestore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bikestores/1
  # DELETE /bikestores/1.json
  def destroy
    @bikestore.destroy
    respond_to do |format|
      format.html { redirect_to bikestores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bikestore
      @bikestore = Bikestore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bikestore_params
      params.require(:bikestore).permit(:checked, :accuracy, :state, :name, :address, :latitude, :longitude, :phone, :zipcode)
    end
end
