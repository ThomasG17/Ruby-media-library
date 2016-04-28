class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.timestamps :date_debut
      t.timestamps :date_fin

      t.timestamps null: false
    end
  end
end
