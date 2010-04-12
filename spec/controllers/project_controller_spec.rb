require 'spec_helper'

describe ProjectController do
  before(:each) do
    @project = DataFactory.project
  end
  
  describe "show" do
    integrate_views
    it "should show the project page if the project exists" do
      Project.should_receive(:get).with(@project.id).and_return(@project)
      get :show, :id => @project.id
      response.should be
      response.should have_tag("div#project") do 

      end
    end
  end

  describe "edit" do
    integrate_views

    it "should show the project edit page if it exists" do
      Project.should_receive(:get).with("100").and_return(@project)
      get :edit, :id=>"100"
      response.should be
    end
  end

  describe "update" do
    after(:each) do
      post :update, :id=>"200", :project => DataFactory.properties_post_info
      response.should be
    end

    it "should let you update the project properties" do
      Project.should_receive(:get).with("200").and_return(@project)
      @project.should_receive(:save).and_return(true)
    end
  end

end