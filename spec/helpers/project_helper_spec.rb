require 'spec_helper'

describe ProjectHelper do
  include ProjectHelper
  before(:each) do
    @project = DataFactory.project
  end
  describe "should show the status of a project" do
    it "as closed if it is not alive" do
      @project.isAlive = false
      assigns[:project] = @project
      show_project_status.should == "Closed"
    end
    it "as open if it is alive" do
      @project.isAlive = true
      assigns[:project] = @project
      show_project_status.should == "Open"
    end
  end
  describe "change status of project" do
    it "should display close link if the project is alive" do
      @project.isAlive = true
      change_status_link.should == link_to("Close Project", close_project_path(@project.id), :confirm => "Are you Sure?")
    end
    it "should display reopen link if the project is not alive" do
      @project.isAlive = false
      change_status_link.should == link_to("Reopen Project", reopen_project_path(@project.id), :confirm => "Are you Sure?")
    end
  end
  describe "should generate appropriate form tags" do
    it "should generate text area if property type is comment_string" do
      generate_form_tag_for_property(Property.new(:key => "124", :type => "comment_string"), nil).should ==
              text_area_tag("project[properties[124]]", nil, :rows => "4", :cols => "20")
    end
    it "should generate text field if property type is string" do
      generate_form_tag_for_property(Property.new(:key => "124", :type => "string"), nil).should ==
              text_field_tag("project[properties[124]]", nil)
    end
    it "should generate combo with values if property type is list" do
      allowed_values = ["A", "B"]
      @project.properties["124"] = "B"
      generate_form_tag_for_property(Property.new(:key => "124", :type => "list", :allowed_values => allowed_values), nil).should ==
              select_tag("project[properties[124]]", options_for_select(allowed_values, "B"))
    end
  end
end