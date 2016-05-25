class AddProduitToLocation < ActiveRecord::Migration
  def change
  	add_reference :locations, :produit, index: true, foreign_key: true
  end
end
