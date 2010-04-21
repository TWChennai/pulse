require File.dirname(__FILE__) + '/../../spec_helper'

describe "CSV Adapte for Project Dashboard" do
  it "should have the week ending date" do
    pending
    week_ending_date = "04/16/2010"
    csv_object = CSVAdapter::ProjectDashboard.new(DataFactory.projects_dashboard,week_ending_date).to_csv
    csv_object.should_not == ""
    columns_in_csv_object = csv_object.split("\n");
    columns_in_csv_object.should == ["Week Ending,#{week_ending_date}"]
  end
end