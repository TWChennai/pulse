class DMNote < CouchRest::ExtendedDocument
  use_database COUCHDB_SERVER
  property :note
  property :location
  property :created_at, :cast_as => "Date"

  view_by :created_at, :descending => true, :map =>
                  "function(doc) {
  if (doc['couchrest-type'] == 'DMNote') {
    emit(doc.created_at, doc);
  }
  }"

  def self.filter_by_date(start_date, end_date)
    view("by_created_at", {:startkey => start_date, :endkey => end_date})
  end
end