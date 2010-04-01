begin
  env = ENV['RAILS_ENV'] || 'development'

  couchdb_config = YAML::load(ERB.new(IO.read(RAILS_ROOT + "/config/couchdb.yml")).result)[env]

  host      = couchdb_config["host"]
  port      = couchdb_config["port"]
  database  = couchdb_config["database"]
  username  = couchdb_config["username"]
  password  = couchdb_config["password"]
  ssl       = couchdb_config["ssl"]       || false

  host     = "localhost"  if host.blank?
  port     = "5984"       if port.blank?
  ssl      = false        if ssl.blank?

  protocol = ssl ? 'https' : 'http'
  authorized_host = (username.blank? && password.blank?) ? host : "#{CGI.escape(username)}:#{CGI.escape(password)}@#{host}"

  db_connection_string = "#{protocol}://#{authorized_host}:#{port}/#{database}"
  COUCHDB_SERVER = CouchRest.database!(db_connection_string)
  
rescue StandardError => e
  raise <<-EOS

There was a problem with your config/couchdb.yml file.
Check and make sure it's present and the syntax is correct.
Loading failed with error: #{e.inspect}.

EOS

end