require 'csv'
module ExcelAdapter
  class MetricsView

    def initialize(metric, project_metrics_data, week_range, projects_list, project_status)
      @metric = metric
      @metrics_data = project_metrics_data
      @week_range = week_range
      @all_projects = projects_list
      @project_status = project_status
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
        dm_notes = ["DM Notes"]
        @all_projects.each do |project|
          project_metric_for_week = project.metric_for_week(@project_status, @metrics_data, @metric, week)
          week_data << project_metric_for_week[:value]
          week_comment_data << project_metric_for_week[:comment]
          dm_notes << project_metric_for_week[:dm_notes]
        end
        csv << week_data
        csv << week_comment_data
        csv << dm_notes
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