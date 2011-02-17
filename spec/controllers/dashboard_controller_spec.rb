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

describe DashboardController, "dm_notes" do
  it "should fetch all dm notes from db" do
    DMNote.create(:note => "Note 1", :location => "Chennai")
    DMNote.create(:note => "Note 2", :location => "Delhi")
    DMNote.create(:note => "Note 3", :location => "Pune")

    get :dm_notes
    assigns[:dm_notes].should == DMNote.view("by_created_at")
  end
end