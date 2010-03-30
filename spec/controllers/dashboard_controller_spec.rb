require 'spec_helper'

describe DashboardController do
  before(:each) do
    @projects_list =  DataFactory.list_of_projects
    end
    it "should display the list of all projects" do
      Project.should_receive(:all).and_return(@projects_list)
      get :index
      response.should be
    end
  end
