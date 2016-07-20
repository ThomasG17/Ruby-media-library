class AddBackToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :back, :boolean, default: false
  end
end
