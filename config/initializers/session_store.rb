# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_opendata_session',
  :secret      => '39328293bdde5c88f9b9e30266cc460466a4dbfbe44f4074dd80fe9a8ca5fbcb7477899518b82bbf45b01102b7ee2eabf434a4f978959dec04e13c4e7bd6f34b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
