require 'spec_helper'

describe "/dashboard/index" do
  before(:each) do
    @projects_list = DataFactory.list_of_projects
    assigns[:projects] = @projects_list
    render 'dashboard/index'
  end
  it "should display the projects list" do
    response.should be
    response.should have_tag('h1',/Portfolio Dashboard/)
  end
end
