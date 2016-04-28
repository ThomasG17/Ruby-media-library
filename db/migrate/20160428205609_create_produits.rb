class CreateProduits < ActiveRecord::Migration
  def change
    create_table :produits do |t|
      t.string :nom
      t.boolean :disponibilite
      t.text :description
      t.text :image
      t.string :ean

      t.timestamps null: false
    end
  end
end
