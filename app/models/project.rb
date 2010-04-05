class Project < CouchRest::ExtendedDocument
  SERVER = CouchRest.new
  SERVER.default_database = 'projects'
  use_database SERVER.default_database

  property :metrics
  property :properties

  property :name

  view_by :list,
    :map => 
    "function(doc) {
            if (doc['couchrest-type'] == 'Project') {
                     emit(doc._id, doc.name);
            }
        }"
        
  def initialize(*args)
    self.properties = {}
    self.metrics = {}
    super(*args)
  end

end