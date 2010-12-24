require 'spec_helper'

describe Risk do
  it "should calculate the no of days the risk was open" do
    Timecop.freeze(Time.parse("12/24/2010")) do
      risk = Risk.new(DataFactory.risk)
      risk["start_date"] = "12/19/2010"
      risk.days_open.should == 5
    end
  end
  it "should say invalid date if the date is not of expected format" do
    risk = Risk.new(DataFactory.risk)
    risk["start_date"] = "12/19"
    risk.days_open.should == "(Invalid date)"
  end
  it "should say -- if the risk is closed" do
    risk = Risk.new(DataFactory.risk)
    risk["state"] = "Closed"
    risk.days_open.should == "--"
  end
end
