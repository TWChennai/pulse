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
    it "should throw an error on editing a project that is not alive" do
      @project.isAlive = false
      Project.should_receive(:get).with("100").and_return(@project)
      get :edit, :id=>"100"
      response.should render_template('public/404.html')
    end
  end

  describe "update" do
    it "should let you update the project properties" do
      Project.should_receive(:get).with("200").and_return(@project)
      @project.should_receive(:save).and_return(true)
      post :update, :id=>"200", :project => DataFactory.properties_post_info
      response.should be
      
    end
    it "should not let you update if the project is not alive" do
      @project.isAlive = false
      Project.should_receive(:get).with("200").and_return(@project)
      post :update, :id=>"200", :project => DataFactory.properties_post_info
      response.should be
      
      response.should render_template('public/404.html')
    end
  end

  describe "close project" do

    #TODO method redirect if .get fails
    it "should change the isActive of a project to false" do
      get :close, :id => @project.id
      project = Project.get(@project.id)
      project.isAlive.should == false
      flash[:notice].should == "Project has been successfully closed."
      response.should redirect_to(:action => 'show', :id => @project.id)
    end
    it "should throw an error that the project is already closed when attempting to close an already closed project" do
      get :close, :id => @project.id
      project = Project.get(@project.id)
      get :close, :id => @project.id
      flash[:error].should == "Attempting to close a project which is already closed"
      response.should redirect_to(:action => 'show', :id => @project.id)
    end
  end

  describe "reopen project" do
    it "should change isActive of a project to true if project is closed" do
      project = Project.get(@project.id)
      project.isAlive = false
      project.save
      get :reopen, :id => @project.id
      flash[:notice].should == "Project has been successfully reopened."
      project = Project.get(@project.id)
      project.isAlive.should == true
      response.should redirect_to(:action => 'show', :id => @project.id)
    end
    it "should throw an error if the project is already open" do
      get :reopen, :id => @project.id
      flash[:error].should == "Attempting to reopen a project which is already open."
      project = Project.get(@project.id)
      project.isAlive.should == true
      response.should redirect_to(:action => 'show', :id => @project.id)
    end
  end

end
