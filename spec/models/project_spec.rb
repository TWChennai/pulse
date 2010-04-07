require File.dirname(__FILE__) + '/../spec_helper'

describe Project do
  describe "metric groups for the current project" do
    it "should return only mandatory metrics from template when no metrics are assigned" do
      project = DataFactory.project(:metric => [])
      project.stuff_metrics.should == DataFactory.mandatory_metrics_hash
    end
    
    it "should return mandatory metrics from template and metrics assigned for project" do
      this_project_metrics = DataFactory.non_mandatory_metrics[0..2]
      project = DataFactory.project("metrics" => this_project_metrics)      
      project.stuff_metrics.map{|hash| hash["key"]}.should == DataFactory.mandatory_metrics + this_project_metrics
    end
  end
end