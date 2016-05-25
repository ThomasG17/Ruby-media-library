class AddProductImageToProduits < ActiveRecord::Migration
  def up
    add_attachment :produits, :product_image
  end

  def down
    remove_attachment :produits, :product_image
  end
end