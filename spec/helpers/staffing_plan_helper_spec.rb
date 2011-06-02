require 'spec_helper'

describe StaffingPlanHelper do
  include StaffingPlanHelper
  before(:each) do
    @project = DataFactory.project
  end

  describe "calculations" do
    it "should populate value in editable text boxes" do
      populate("").should == "0"
      populate("3").should == "3"
      populate(nil).should == "0"
    end

    it "should calculate offshore amount billed" do
      offshore_amount_billed(DataFactory.staffing_plan).should == 280
    end

    it "should calculate onsite amount billed" do
      onsite_amount_billed(DataFactory.staffing_plan).should == 1050
    end

    it "should calculate cumulative offshore amount" do
      plans = [DataFactory.staffing_plan, DataFactory.staffing_plan]
      cumulative_offshore_amount_billed(plans, 0).should == 280
      cumulative_offshore_amount_billed(plans, 1).should == 560
    end

    it "should calculate cumulative offshore velocity" do
      plans = [DataFactory.staffing_plan({"no_of_dev_offshore" => "12"}), DataFactory.staffing_plan({"no_of_dev_offshore" => "12"})]
      cumulative_offshore_velocity(plans, 0).should == 18
      cumulative_offshore_velocity(plans, 1).should == 36
    end

    it "should calculate cumulative onsite velocity" do
      plans = [DataFactory.staffing_plan, DataFactory.staffing_plan]
      cumulative_onsite_velocity(plans, 0).should == 0
      cumulative_onsite_velocity(plans, 1).should == 0
    end

    it "should calculate cumulative onsite amount" do
      plans = [DataFactory.staffing_plan, DataFactory.staffing_plan]
      cumulative_onsite_amount_billed(plans, 0).should == 1050
      cumulative_onsite_amount_billed(plans, 1).should == 2100
    end

    it "should calculate offshore_velocity" do
      offshore_velocity(DataFactory.staffing_plan({"no_of_dev_offshore" => "12"})).should == 18 
    end

    it "should calculate onsite_velocity" do
      offshore_velocity(DataFactory.staffing_plan({"no_of_dev_onsite" => "2"})).should == 0 
    end
  end
end