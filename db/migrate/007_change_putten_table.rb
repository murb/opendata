class ChangePuttenTable < ActiveRecord::Migration
  def self.up
    add_column :putten, :minimum_verwachte_investering, :string
    add_column :putten, :maximum_verwachte_investering, :string
    add_column :putten, :wordt_het_wat, :text
    add_column :putten, :verantwoordelijken, :text
  end

  def self.down
    remove_column :putten, :verantwoordelijken
    remove_column :putten, :wordt_het_wat
    remove_column :putten, :maximum_verwachte_investering
    remove_column :putten, :minimum_verwachte_investering
  end
end
