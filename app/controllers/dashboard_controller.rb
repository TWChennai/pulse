class DashboardController < ApplicationController
  def index
    @title = "Project Dashboard"
   @projects = Project.all
  end
end
