class LocatieToevoegenAanPut < ActiveRecord::Migration
  def self.up
    add_column :putten, :locatie, :string
  end

  def self.down
    remove_column :putten, :locatie
  end
end
