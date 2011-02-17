class DMNote < CouchRest::ExtendedDocument
  use_database COUCHDB_SERVER
  property :note
  property :location
  timestamps!

  view_by :created_at, :descending => true
end