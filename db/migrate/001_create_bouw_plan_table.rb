class CreateBouwPlanTable < ActiveRecord::Migration
  def self.up
    create_table :bouwplans, :force => true do |b|
      b.string :dossiernummer
      b.string :locatieaanduiding
      b.date :datum_indiening
      b.string :postcode
      b.string :wijk
      b.text :omschrijving
      b.string :status
      b.date :datum_status
      b.string :tekening
      b.timestamps
    end
  end

  def self.down
    drop_table :bouwplans
  end
end
