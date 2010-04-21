class DashboardController < ApplicationController
  def index
    @title = "Project Dashboard"
    @week_ending_date = (params[:date].nil? ? week_ending_date : params[:date])
    @projects_dashboard = Project.view("by_dashboard",{:key => @week_ending_date })
    puts @projects_dashboard.inspect
  end
  def export_to_csv
    @week_ending_date = (params[:date].nil? ? week_ending_date : Time.at(params[:date].to_i).to_date.strftime("%m/%d/%Y"))
    @projects_dashboard = Project.view("by_dashboard",{:key => @week_ending_date })
    send_data CSVAdapter::ProjectDashboard.new(@projects_dashboard,@week_ending_date).to_csv, :filename => "#{@week_ending_date}.csv"
  end
  private
  def week_ending_date
    (Date.today.end_of_week - 9.days).strftime("%m/%d/%Y")
  end
end
