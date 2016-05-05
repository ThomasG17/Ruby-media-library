class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.datetime :date_debut
      t.datetime :date_fin

      t.timestamps null: false
    end
  end
end
