require 'spec_helper'

describe ProjectController do
  before(:each) do
    @project = DataFactory.project_properties
  end

  describe "show page" do
    integrate_views
    it "should show error page if project does not exist" do
      Project.should_receive(:get).with("12345").and_raise(RestClient::ResourceNotFound)
      @controller.should_receive(:render).with(:template=>'public/404.html')
      get :show, :id=> "12345"
      response.should be
    end

    it "should show the project page if the project exists" do
      Project.should_receive(:get).with("20").and_return(@project)
      get :show, :id => "20"
      response.should be
      response.should have_tag("div#project") do 
        with_tag("div#project_name", /Project Name/)
      end
    end
  end

  describe "edit page" do
    integrate_views
    it "should show the project edit page if it exists" do
      Project.should_receive(:get).with("100").and_return(@project)
      get :edit, :id=>"100"
      response.should be
      
    end
    it "should show the error page if project does not exist" do
      Project.should_receive(:get).with("200").and_raise(RestClient::ResourceNotFound)
      @controller.should_receive(:render).with(:template=>'public/404.html')
      get :edit, :id=>"200"
    end
  end

  describe "update page" do
    it "should let you update the project properties" do
      pending
      Project.should_receive(:get).with("200").and_return(@project)
      @project.should_receive(:save).and_return(true)
      post :update, :project=> {:id=>"200"}, :properties => DataFactory.properties_post_info
      response.should be
    end
    it "should not let u update if it cannot find the project" do
      Project.should_receive(:get).with("200").and_raise(RestClient::ResourceNotFound)
      @controller.should_receive(:render).with(:template=>'public/404.html')
      post :update, :project=> {:id=>"200"}, :properties => DataFactory.properties_post_info
    end
  end

end