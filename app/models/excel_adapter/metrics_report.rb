module ExcelAdapter
  class MetricsReport

    def initialize(metric, project_metrics_data, week_range, projects_list, project_status)
      @metric = metric
      @metrics_data = project_metrics_data
      @week_range = week_range
      @all_projects = projects_list
      @project_status = project_status
    end

    def to_excel
      excel = Excel.new
      excel.create_row_with ["Metrics View", @metric, @week_range.last.to_s, @week_range.first.to_s]
      populate_metrics_view_header(excel)
      populate_metrics_view_data(excel)
      excel.write_to_file("metric.xls")
      excel.path
    end

    private

    def populate_metrics_view_header(excel)
      header = ["Week Ending"]
      @all_projects.each do |project|
        header << project.name
      end
      excel.create_row_with header
    end

    def populate_metrics_view_data(excel)
      @week_range.each do |week|
        week_data = []
        dm_notes = ["DM Notes"]
        week_data << [week.to_s, ""]
        @all_projects.each do |project|
          project_metric_for_week = project.metric_for_week(@project_status, @metrics_data, @metric, week)
          week_data << [project_metric_for_week[:value], project_metric_for_week[:comment]]
          dm_notes << project_metric_for_week[:dm_notes]
        end
        excel.create_row_with_comments week_data
        excel.create_row_with dm_notes
      end
    end

  end
end