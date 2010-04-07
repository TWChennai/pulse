class ProjectTemplate < CouchRest::ExtendedDocument
  use_database COUCHDB_SERVER
  TEMPLATE_JSON_FILE = Rails.root.join("db", "couch", "project_template.json")
  DESIGN_DOC = "_design/template"

  property :metrics_group, :cast_as => [MetricGroup]
  property :properties_group, :cast_as => [Property]
  property :name  

  def self.create
    COUCHDB_SERVER.save_doc({
      "_id" => DESIGN_DOC,
      "properties_group" => properties_group_from_json,
      "metrics_group" => metrics_group_from_json,
      "couchrest-type" => name
    })
  end

  def self.project_template
    get DESIGN_DOC
  end

  def self.metrics_group_from_json
    hash_from_json["metrics_group"]
  end
  
  def self.properties_group_from_json
    hash_from_json["properties_group"]
  end
  
  def self.hash_from_json
    @@hash ||= JSON.parse(File.read(TEMPLATE_JSON_FILE))
  end
  
  private_class_method :hash_from_json
end