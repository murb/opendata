class AddHoeveelToPutten < ActiveRecord::Migration
  def self.up
    add_column :putten, :hoeveel, :text
  end

  def self.down
    remove_column :putten, :hoeveel
  end
end
