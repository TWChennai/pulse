module ExcelAdapter
  class ProjectDashboard
    def initialize(projects_dashboard, week_ending)
      @dashboard_data = projects_dashboard
      @week_ending = week_ending
    end

    def to_excel
      excel = Excel.new
      excel.create_row_with ["Week Ending", @week_ending]
      populate_dashboard_header(excel)
      populate_dashboard_iteration_information(excel)
      excel.write_to_file("#{@week_ending.gsub("/", "-")}.xls")
      excel.path
    end

    private

    def populate_dashboard_header(excel)
      header = ["Project Name"]
      @dashboard_data.first.iterations.first.mandatory_metrics.each do |metric|
        header << metric.name
      end
      excel.create_row_with header + ["DM Note"]
    end

    def populate_dashboard_iteration_information(excel)
      @dashboard_data.each do |project|

        project_iteration_information = [[project.name, ""]] +
                  project.iterations.first.mandatory_metrics.collect { |metric| [metric.value.downcase,metric.comment]} +
                 [[project.iterations.first.dm_notes,""]]

        excel.create_row_with_comments(project_iteration_information)
      end
    end
  end
end
