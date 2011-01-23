class Onderhoudskosten < ActiveRecord::Migration
  def self.up
    add_column :putten, :onderhoudskosten, :integer
  end

  def self.down
    remove_column :putten, :onderhoudskosten
  end
end
