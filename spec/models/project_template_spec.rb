require File.dirname(__FILE__) + '/../spec_helper'

describe ProjectTemplate do
  describe "filter risk types" do
    it "should return only tracked risk types" do
      ProjectTemplate.stub!(:risk_types_from_json).and_return([{"track-history" => false}, {"track-history" => true}])
      ProjectTemplate.tracked_risks_from_json.size().should == 1
    end

    it "should return only user input risk types" do
      ProjectTemplate.stub!(:risk_types_from_json).and_return([{"user-input" => true}, {"user-input" => true},
                                                               {"user-input" => false}])
      ProjectTemplate.user_input_risk_types_from_json.size().should == 2
    end
  end
end