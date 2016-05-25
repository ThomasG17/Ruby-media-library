class ProduitsController < ApplicationController
  before_action :set_produit, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Home", :root_path

  # GET /produits
  # GET /produits.json
  def index
    @produits = Produit.all
  end

  # GET /produits/1
  # GET /produits/1.json
  def show
    set_produit
    add_breadcrumb @produit.nom
  end

  # GET /produits/new
  def new
    @produit = Produit.new
  end

  # GET /produits/1/edit
  def edit
    set_produit
  end

  # POST /produits
  # POST /produits.json
  def create
    @produit = Produit.new(produit_params)

    respond_to do |format|
      if @produit.save
        format.html { redirect_to @produit, notice: 'Produit was successfully created.' }
        format.json { render :show, status: :created, location: @produit }
      else
        format.html { render :new }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produits/1
  # PATCH/PUT /produits/1.json
  def update
    respond_to do |format|
      if @produit.update(produit_params)
        format.html { redirect_to @produit, notice: 'Produit was successfully updated.' }
        format.json { render :show, status: :ok, location: @produit }
      else
        format.html { render :edit }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produits/1
  # DELETE /produits/1.json
  def destroy
    @produit.destroy
    respond_to do |format|
      format.html { redirect_to produits_url, notice: 'Produit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def rent
    respond_to do |format|
      if @produit.rent(produit_params)
        format.html { redirect_to thanks, notice: 'Move was successfully destroyed.' }
        format.json { head :no_content }
        produit.disponibilite = false;
      else
        format.html { render :edit }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produit
      @produit = Produit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produit_params
      params.require(:produit).permit(:nom, :disponibilite, :description, :image, :ean, :product_image)
    end
end
