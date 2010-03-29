require 'spec_helper'

describe DashboardController do
  it "should get the project template" do
    PROJECT_TEMPLATE = "56071a715dc0d9b24c5804f966f179e6"
    @@db = CouchRest.database!("http://127.0.0.1:5984/projects")
    @template = @@db.get(PROJECT_TEMPLATE)
    @fields = @template["tracking"]["properties"]
    @fields.each do |field|
        if(field[1]["tracked"]=="yes")
          puts field[1]["description"]
        end
    end
  end
end