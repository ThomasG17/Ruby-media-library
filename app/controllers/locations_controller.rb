class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations/new
  def new
    @location = Location.new(produit_id: params[:produit_id], user_id: params[:user_id], date_debut: Date.today, date_fin: Date.today + 15)
    @location.save
    if @location.save
      @produit = Produit.find(params[:produit_id])
      @produit.disponibilite = @produit.disponibilite - 1
      @produit.save
      redirect_to list_locations_user_url(params[:user_id]), notice: 'Location was successfully created.'
    else
       render :new
    end
  end

  def back
    @location = Location.find(params[:id])
    @location.back = true
    @location.save
    if @location.save
      @product = Produit.find(@location.id)
      @product.disponibilite = @product.disponibilite + 1
      @product.save
      redirect_to root_url, notice: 'Location was successfully back.'
    end
  end

  def show

  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
     @location = Location.new(location_params)
     if @location.save
        redirect_to root_path, notice: 'Location was successfully created.'
     else
        render :new
     end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:date_debut, :date_fin, :produit_id, :user_id, :back)
    end
end
