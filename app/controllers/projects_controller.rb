class ProjectsController < ApplicationController
  def list_closed_projects
    @projects = Project.closed_projects
  end
end