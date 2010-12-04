class CreateBouwPlanTable < ActiveRecord::Migration
  def self.up
    create_table :bouwplans, :force => true do |b|
      b.dossiernummer
      b.locatieaanduiding
      b.datum_indiening
      b.postcode
      b.wijk
      b.omschrijving
      b.status
      b.datum_status
      b.tekening
      b.timestamps
    end
  end

  def self.down
    drop_table :bouwplans
  end
end
