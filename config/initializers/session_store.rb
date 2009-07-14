# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_publishingdb_session',
  :secret      => 'b5fd7479dcc48d24fd2c72c3e2c68e9c74825c29bfde5dd248a90e161b8f686656589dddbb7a3551f77c685e10fa2d700d7df3192ad50cfbf9642c348f7bfa15'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
