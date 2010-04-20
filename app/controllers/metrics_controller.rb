class MetricsController < ApplicationController
  def index

    @metrics_list = ProjectTemplate.mandatory_metrics.collect{|metric| metric.name}

    @from_date = params[:from_date].nil? ? Date.today - 100.days : Date.parse(params[:from_date])
    @to_date = params[:to_date].nil? ? Date.today : Date.parse(params[:to_date])
    @metric = params[:metric].nil? ? @metrics_list.first : params[:metric] 

    @week_range = week_range(@from_date,@to_date).reverse
    @title= "Metrics View"

    @projects_metric_view = Project.view("by_metric", :startkey=>[@metric, @from_date.to_time.to_i], :endkey=>[@metric, @to_date.to_time.to_i] , :include_docs => false, :reduce => false)
    
    puts @projects_metric_view.inspect
    @projects_template = ProjectTemplate.project_template
    @projects_list = Project.all

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