class Project < Model
  TEMPLATE = "56071a715dc0d9b24c5804f966f179e6"
  DB_NAME = "projects"
  @@db = CouchRest.database!(HOST+":"+PORT+"/"+DB_NAME)
  def self.project_template
    Project.find(TEMPLATE)
  end
  def self.all
    @@db.view("list/list_projects")
  end
end
