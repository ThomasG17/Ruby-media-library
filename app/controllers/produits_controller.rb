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
    @comments_users = @produit.comments
    @comment = Comment.new( :produit => @produit )
    add_breadcrumb @produit.nom
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produit
      @produit = Produit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produit_params
      params.require(:produit).permit(:nom, :disponibilite, :description, :ean, :product_image, :type, :comments)
    end
end
