class Project < CouchRest::ExtendedDocument
  use_database COUCHDB_SERVER

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

  def stuff_properties
    ProjectTemplate.project_template.properties_group.map do |property|
      {
        :key => property.key,
        :name => property.name,
        :description => property.description, 
        :value => self.properties[property.key]
      }
    end
  end
end
