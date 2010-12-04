class AddLatLongToBouwplan < ActiveRecord::Migration
  def self.up
    add_column :bouwplans, :lat, :float
    add_column :bouwplans, :lng, :float
  end

  def self.down
    remove_column :bouwplans, :lat
    remove_column :bouwplans, :lng
  end
end