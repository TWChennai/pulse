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
      expected = project.stuffed_metrics.map { |hash| hash["key"] }
      (DataFactory.mandatory_metrics + this_project_metrics).each { |metric| expected.should include(metric) }
      (DataFactory.mandatory_metrics + this_project_metrics).size.should == expected.size
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
  describe "project creation validations" do
    it "should enter project name and mandatory properties" do
      project = Project.new
      project.valid?.should be_false
      project.errors.full_messages.flatten.should include("Name must not be blank", "Engagement model must not be blank", "Development languages used must not be blank",
                                                          "Client must not be blank", "Pm must not be blank", "Dm must not be blank", "Cp must not be blank",
                                                          "Dp must not be blank", "Region must not be blank", "Delivery status must not be blank",
                                                          "Client category must not be blank")
    end
  end

  describe "get data returns property value and comment from any level" do

    it "should return at project level" do
      project = Project.new(:location => "chennai")
      project.get_data("location").should == {:value => "chennai", :comment => ""}
    end

    it "should return at project property level" do
      project = Project.new(:location => "chennai", :project_properties => {"pm" => "Brick"})
      project.get_data("pm").should == {:value => "Brick", :comment => ""}
    end

    it "should return at latest iteration level" do
      project = Project.new(:location => "chennai", :iterations => [Iteration.new(:dm_notes => "follow up"), Iteration.new])
      project.get_data("dm_notes").should == {:value => "follow up", :comment => ""}
    end

    it "should return at latest iteration metric level" do
      project = Project.new(:location => "chennai",
                            :iterations => [Iteration.new(:dm_notes => "follow up",
                                                          :metrics => [Metric.new(:name => "Agile Practices", :value => "green",
                                                                                  :comment => "improving")]), Iteration.new])
      project.get_data("Agile Practices").should == {:value => "green", :comment => "improving"}
    end


  end
end