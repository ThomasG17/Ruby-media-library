class ProduitsController < ApplicationController
  before_action :set_produit, only: [:show]
  add_breadcrumb "Accueil", :root_path

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
