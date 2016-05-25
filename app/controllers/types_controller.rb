class TypesController < ActionController::Base
  add_breadcrumb "Accueil", :root_path

  # GET /types
  # GET /types.json
  def index
    @types = Type.all
  end

  def list_produits
    @produits = Produit.find(params[:type])
    add_breadcrumb :type.name
  end
end
