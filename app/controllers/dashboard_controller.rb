class DashboardController < ApplicationController
  def index
    @title = "Project Dashboard"
    @week_ending_date = (params[:date].nil? ? week_ending_date : params[:date])
    @project_status = (params[:status].nil? ? true : params[:status].to_bool)
    @projects_dashboard = Project.view("by_dashboard",{:startkey => [@project_status, @week_ending_date], :endkey => [@project_status,@week_ending_date]})
    @mandatory_metrics = ProjectTemplate.mandatory_metrics
  end
  def export_to_csv
    @week_ending_date = (params[:date].nil? ? week_ending_date : Time.at(params[:date].to_i).to_date.strftime("%m/%d/%Y"))
    @project_status = (params[:status].nil? ? true : params[:status].to_bool) 
    @projects_dashboard = Project.view("by_dashboard",{:startkey => [@project_status, @week_ending_date], :endkey => [@project_status,@week_ending_date]})
    send_data CSVAdapter::ProjectDashboard.new(@projects_dashboard,@week_ending_date).to_csv, :filename => "#{@week_ending_date}.csv"
  end
  private
  def week_ending_date
    (Date.today.end_of_week - 9.days).strftime("%m/%d/%Y")
  end
  # def get_project_status
  #   if params[:status] == "true"
  #     return true
  #   elsif params[:status] == "false"
  #     return false
  #   end
  # end
end
