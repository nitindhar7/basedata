# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_google_base_data_session',
  :secret      => '543fc9bf662121885ae6c41561c3e02a22ffb5c34ed66470ccd9646792d9e60979681253065a90d454d84e419931e7ef9f93a0f0955a71d4b21e45a6c32b684f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
