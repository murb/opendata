class CreatePuts < ActiveRecord::Migration
  def self.up
    create_table :puts do |t|
      t.string :titel
      t.text :omschrijving
      t.integer :geinvesteerd
      t.integer :verwachte_opbrengst
      t.text :alternatief
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end

  def self.down
    drop_table :puts
  end
end
