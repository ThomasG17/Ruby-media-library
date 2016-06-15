class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :produit, index: true, foreign_key: true
    end
  end
end
