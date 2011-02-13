class CreateContactMails < ActiveRecord::Migration
  def self.up
    create_table :contact_mails do |t|
      t.string :naam
      t.string :email
      t.string :onderwerp
      t.text :bericht

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_mails
  end
end
