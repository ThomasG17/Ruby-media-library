class HomeController < ApplicationController
  def index
    @produits = Produit.all
  end
end
