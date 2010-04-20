class DashboardController < ApplicationController
  def index
    @title = "Project Dashboard"
    # @projects = Project.all
    @week_ending_date = (params[:date].nil? ? week_ending_date : params[:date])
    @projects_dashboard = Project.view("by_dashboard",{:key => @week_ending_date })
    @projects_template = ProjectTemplate.project_template
  end
  private
  def week_ending_date
    (Date.today.end_of_week - 9.days).strftime("%m/%d/%Y")
  end
end
