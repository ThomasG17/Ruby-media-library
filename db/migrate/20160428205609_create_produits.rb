class CreateProduits < ActiveRecord::Migration
  def change
    create_table :produits do |t|
      t.string :nom
      t.integer :disponibilite
      t.text :description
      t.string :ean
      t.belongs_to :type, index: true
      t.timestamps null: false
    end
  end
end
