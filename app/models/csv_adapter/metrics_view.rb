require 'csv'
module CSVAdapter
  class MetricsView

    def initialize(metric, project_metrics_data, week_range, projects_list)
      @metric = metric
      @metrics_data = project_metrics_data
      @week_range = week_range
      @all_projects = projects_list
    end
    
    def to_csv
      csv_stream do |csv|
        csv << ["Metrics View", @metric, @week_range.last, @week_range.first]
        csv << []
        csv << []
        get_metrics_view_header(csv)
        get_metrics_view_data(csv)
      end
    end
    
    private
    
    def get_metrics_view_header(csv)
      header = ["Week Ending"]
      @all_projects.each do |project|
        header << project.name
      end
      csv << header
    end
    
    def get_metrics_view_data(csv)
      @week_range.each do |week|
        week_data = []
        week_comment_data = []
        week_data << week
        week_comment_data = ["Comment"]
        @all_projects.each do |project| 
          week_data << project.metric_for_week(@metrics_data,@metric, week)[:value]
          week_comment_data << project.metric_for_week(@metrics_data,@metric,week)[:comment]
        end
        csv << week_data
        csv << week_comment_data
        csv << []
        csv << []
      end
    end
    
    def csv_stream
      stream = out_stream
      CSV::Writer.generate(stream) do |csv|
        yield(csv)
      end
      stream
    end

    def out_stream
      String.new
    end
     
  end
end