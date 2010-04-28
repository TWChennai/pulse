require 'spec_helper'

describe ProjectHelper do
  include ProjectHelper
  before(:each) do
    @project = DataFactory.project
  end
  describe "should show the status of a project" do
    it "as closed if it is not alive" do
      @project.isAlive = false
      assigns[:project] = @project
      show_project_status.should == "Closed"
    end
    it "as open if it is alive" do
      @project.isAlive = true
      assigns[:project] = @project
      show_project_status.should == "Open"
    end
  end
  describe "change status of project" do
    it "should display close link if the project is alive" do
      @project.isAlive = true
      change_status_link.should == link_to("Close Project", close_project_path(@project.id), :confirm => "Are you Sure?")
    end
    it "should display reopen link if the project is not alive" do
      @project.isAlive = false
      change_status_link.should == link_to("Reopen Project", reopen_project_path(@project.id), :confirm => "Are you Sure?")
    end
  end
end