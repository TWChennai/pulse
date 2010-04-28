require 'spec_helper'
describe ProjectsController do
  it "should display the list of all closed projects" do
    @projects = Project.all(:conditions => {:isAlive => false})
  end
end