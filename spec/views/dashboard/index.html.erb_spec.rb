require 'spec_helper'

describe "/dashboard/index" do
  before(:each) do
    @projects_list = DataFactory.list_of_projects
    assigns[:projects] = @projects_list
    render 'dashboard/index'
  end
end
