class AddPlaatsnaamToPutten < ActiveRecord::Migration
  def self.up
    add_column :putten, :plaatsnaam, :string
  end

  def self.down
    remove_column :putten, :plaatsnaam
  end
end
