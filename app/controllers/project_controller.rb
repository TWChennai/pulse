class ProjectController < ApplicationController
  def show 
    db = CouchRest.database!("http://127.0.0.1:5984/projects")
    @project = db.get(params[:id])
    @iterations = @project["iteration_information"]
    @project_properties = @project["properties"]
    @tracked_properties = @project["tracking"]["properties"]
  end
  def new
    db = CouchRest.database!("http://127.0.0.1:5984/projects")
    @project_template = db.get("56071a715dc0d9b24c5804f966f179e6")
    @fields = @project_template["tracking"]["properties"].sort{|a,b| a[1]["order"]<=>b[1]["order"]}
  end
  def save
    puts params[:properties].to_json
  end
end
