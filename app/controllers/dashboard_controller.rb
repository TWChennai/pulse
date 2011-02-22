class DashboardController < ApplicationController
  def index
    @title = "Project Dashboard"
    @week_ending_date = (params[:date].nil? ? week_ending_date : params[:date])
    @project_status = (params[:status].nil? ? true : params[:status].to_bool)
    @location_filter=(params[:location].nil? ? "all": params[:location] )
    
    @projects_dashboard = Project.project_dashboard(@project_status,@week_ending_date)
    @mandatory_metrics = ProjectTemplate.mandatory_metrics
  end

  def export_to_csv
    @week_ending_date = (params[:date].nil? ? week_ending_date : to_date(params[:date]))
    @project_status = (params[:status].nil? ? true : params[:status].to_bool) 
    @projects_dashboard = Project.project_dashboard(@project_status,@week_ending_date)
    @location_filter=(params[:location].nil? ? "all": params[:location] )
    puts Project.project_dashboard(@project_status,@week_ending_date).inspect

    send_data CSVAdapter::ProjectDashboard.new(@projects_dashboard,@week_ending_date).to_csv, :filename => "#{@week_ending_date}.csv"
  end

  def dm_notes
    @dm_notes = DMNote.view("by_created_at")
    render :template => false
  end

  def add_dm_note
    DMNote.create(:note => params["dm_notes"], :location => params["dm_notes_location"], :created_at => Time.now)
    @dm_notes = DMNote.view("by_created_at")
    render :partial => 'dm_notes_table'
  end

  def to_date(from_date)
    Time.at(from_date.to_i).to_date.strftime("%m/%d/%Y")
  end

  def filter_notes_by_date
    @dm_notes = DMNote.filter_by_date(Date.parse(params["to_date"]), Date.parse(params["from_date"]))
    render :partial => 'dm_notes_table'
  end

  private
  def week_ending_date
    (Date.today.end_of_week - 9.days).strftime("%m/%d/%Y")
  end
end
