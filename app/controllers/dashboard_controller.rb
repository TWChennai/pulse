class DashboardController < ApplicationController
  def index
    @title = "Project Dashboard"
    @week_ending_date = (params[:date].nil? ? week_ending_date : params[:date])
    @project_status = (params[:status].nil? ? true : params[:status].to_bool)
    @location_filter=(params[:location].nil? ? "all": params[:location] )
    @region_filter=(params[:region].nil? ? "all": params[:region] )

    @projects_dashboard = fetch_projects_dashboard 
    @mandatory_metrics = ProjectTemplate.mandatory_metrics
  end

  def export_to_csv
    @week_ending_date = (params[:date].nil? ? week_ending_date : to_date(params[:date]))
    @project_status = (params[:status].nil? ? true : params[:status].to_bool)
    @projects_dashboard = fetch_projects_dashboard
    @location_filter=(params[:location].nil? ? "all": params[:location] )
    @region_filter=(params[:region].nil? ? "all": params[:region] )

    send_file ExcelAdapter::ProjectDashboardReport.new(@projects_dashboard,@week_ending_date).to_excel
  end

  def to_date(from_date)
    Time.at(from_date.to_i).to_date.strftime("%m/%d/%Y")
  end

  private
  def week_ending_date
    (Date.today.end_of_week - 9.days).strftime("%m/%d/%Y")
  end

  def fetch_projects_dashboard
    Project.project_dashboard(@project_status,@week_ending_date).uniq
  end
end
