class ProjectsController < ApplicationController
  def list_closed_projects
    @projects = Project.view("by_list", :key => false)
  end
end