require File.dirname(__FILE__) + '/../spec_helper'

describe Project do
  describe "metric groups for the current project" do
    it "should return only mandatory metrics from template when no metrics are assigned" do
      project = DataFactory.project(:metric => [])
      project.stuffed_metrics.should == DataFactory.mandatory_metrics_hash
    end

    it "should return mandatory metrics from template and metrics assigned for project" do
      this_project_metrics = DataFactory.non_mandatory_metrics[0..2]
      project = DataFactory.project("metrics" => this_project_metrics)      
      project.stuffed_metrics.map{|hash| hash["key"]}.should == DataFactory.mandatory_metrics + this_project_metrics
    end
  end
  describe "project list" do
    it "should display only the list of inactive projects" do
      DataFactory.create_projects_with_status 
      projects = Project.view("by_list", :key => false)
      projects.size.should == 1
      projects.each do |project|
        project.isAlive.should == false
      end
    end
  end
end