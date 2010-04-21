require File.dirname(__FILE__) + '/../../spec_helper'

describe "Date Extension" do
  describe "last friday" do
    it "should return the last friday if its before friday of this week" do
      pending
      Time.parse("04/15/2010").last_friday.should == "04/09/2010"
    end
    it "should return the current date if its already a friday" do
      Time.parse("04/16/2010").last_friday.should == "04/16/2010"
    end
    it "should return the current friday if its before the current day in the week" do
      Time.parse("04/17/2010").last_friday.should == "04/16/2010"
    end
    it "should return the last friday if its the sunday in the last week" do
      Time.parse("04/18/2010").last_friday.should == "04/16/2010"
    end
    it "should return the current friday if its the sunday in the week" do
      Time.parse("04/25/2010").last_friday.should == "04/23/2010"
    end
  end
end