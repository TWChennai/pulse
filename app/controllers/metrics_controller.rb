class MetricsController < ApplicationController
  def index
    @week_range = week_range(Date.today - 100.days, Date.today + 10.days)
    @title= "Metrics View"
    @projects_metric_view = Project.view("by_metric",{:key => "Scope" })
    @projects_template = ProjectTemplate.project_template
  end
  private
  def week_range(from_date,to_date)
    if(to_date < from_date) 
      temp = to_date
      to_date = from_date
      from_date = to_date
    end
    @week_ending_dates = []
    date = from_date.end_of_week - 2.days
    while(date < to_date) do 
        @week_ending_dates << date
        date = date + 7.days
    end
    return @week_ending_dates
  end
end