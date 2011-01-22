class DutchifyTables < ActiveRecord::Migration
  def self.up
    rename_table :bouwplans, :bouwplannen
    rename_table :puts, :putten
  end

  def self.down
    rename_table :putten, :puts
    rename_table :bouwplannen, :bouwplans
  end
end
