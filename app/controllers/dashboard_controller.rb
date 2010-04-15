class DashboardController < ApplicationController
  def index
    @title = "Project Dashboard"
    @projects = Project.all
    @projects_dashboard = Project.view("by_dashboard",{:key => '04/16/2010'})
    @projects_template = ProjectTemplate.project_template
  end
end
