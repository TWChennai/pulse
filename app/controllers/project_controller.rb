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
    db = CouchRest.database!("http://127.0.0.1:5984/projects")
    @project_template = db.get("56071a715dc0d9b24c5804f966f179e6")
    @tracked_properties = @project_template["tracking"]["properties"]
    @json_to_save=construct_date_json(@tracked_properties,params[:properties])
    @response_from_server = db.save_doc({:properties=>@json_to_save})
    @id = @response_from_server["id"]
    redirect_to(:action=>'show',:id=>@id)

  end
  private
  def construct_date_json(tracked_properties, actual_properties )
    tracked_properties.each do |property|
      if property[1]["type"] == "date"
        actual_properties[property[0]]= get_date_from_hash(actual_properties[property[0]])
      end
    end
    return actual_properties
  end
  def get_date_from_hash(date_hash)
    Date.civil(date_hash["date(1i)"].to_i,date_hash["date(2i)"].to_i,date_hash["date(3i)"].to_i)
  end
end
