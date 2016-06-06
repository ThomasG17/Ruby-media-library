class TypesController < ApplicationController
  add_breadcrumb "Accueil", :root_path
  layout "application"

  # GET /types
  # GET /types.json
  def index
    @types = Type.all
  end

  def list_produits
    @type_id = params[:id]
    @type = Type.find(@type_id)
    @produits = @type.produits
    add_breadcrumb @type.name
  end
end
