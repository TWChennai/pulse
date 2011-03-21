require 'spec_helper'

describe DashboardController do
  before(:each) do
    @projects_list =  DataFactory.list_of_projects
  end
  it "should display the list of all projects" do
    get :index
    response.should be
  end
end