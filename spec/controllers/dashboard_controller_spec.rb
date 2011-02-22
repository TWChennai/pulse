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
  before(:each) do
    DMNote.create({:note => "Note 1", :location => "Chennai", :created_at => 3.days.ago})
    DMNote.create(:note => "Note 2", :location => "Delhi", :created_at => 2.day.ago)
    DMNote.create(:note => "Note 3", :location => "Pune", :created_at => 1.days.ago)
  end

  it "should fetch all dm notes from db" do
    get :dm_notes
    assigns[:dm_notes].collect(&:note).should == ["Note 3", "Note 2", "Note 1"]
  end

  it "should fetch all dm notes between the given dates" do
    get :filter_notes_by_date, "from_date" => (2.days.ago).to_date.to_s, "to_date" => Date.today.to_s
    assigns[:dm_notes].collect(&:note).should == ["Note 3", "Note 2"]
  end
end