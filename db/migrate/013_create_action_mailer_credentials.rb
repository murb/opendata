class CreateActionMailerCredentials < ActiveRecord::Migration
  def self.up
    create_table :action_mailer_credentials do |t|
      t.string :address
      t.string :port
      t.string :domain
      t.string :authentication
      t.string :user_name
      t.string :password
      t.boolean :tls
      t.boolean :enable_starttls_auto
    end
  end

  def self.down
    drop_table :action_mailer_credentials
  end
end
