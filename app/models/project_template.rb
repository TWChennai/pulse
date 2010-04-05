require 'metric_group'
require 'property'
class ProjectTemplate < CouchRest::ExtendedDocument
  TEMPLATE = "56071a715dc0d9b24c5804f966f179e6"
  SERVER = CouchRest.new
  SERVER.default_database = 'projects'
  use_database SERVER.default_database

  property :metrics_group, :cast_as => [MetricGroup]
  property :properties_group, :cast_as => [Property]
  property :name

  view_by :list,
    :map => 
    "function(doc) {
            if (doc['couchrest-type'] == 'Project') {
                     emit(doc._id, doc.name);
            }
        }"

  def self.project_template
    return ProjectTemplate.get(TEMPLATE)
  end
end