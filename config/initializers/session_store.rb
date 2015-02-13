# TODO is this the right place ?
# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pulse_session',
  :secret      => 'c53d28fab84f5d399b247b5b645adbce1878395c7c935f622cf0e317692adeccde0f33448c4c26b5354d2a0b090ed93234df444fe0b0c55fe53ce868b4610c2cChange'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
