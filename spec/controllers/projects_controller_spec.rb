require 'spec_helper'

describe ProjectsController do
  it "should display the list of all closed projects" do
    list_of_all_projects = DataFactory.create_projects_with_status
    get :list_closed_projects
    assigns[:projects].should == [list_of_all_projects.first]  
  end
end