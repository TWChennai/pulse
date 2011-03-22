module ExcelAdapter
  class ProjectDashboardReport
    REPORT_COLUMN_HEADERS = ["Off", "Reg", "Client", "Contr. Type", "Overall Status", "Delivery Status", "Engagement Status", "Action", "PM", "DM", "CP", "DP", "Practices", "DA Planned", "TA Planned", "Technology", "Client Category"]
    REPORT_COLUMN_PROPERTIES = ["location", "region", "client","engagement_model", "Overall Status", "delivery_status", "Engagement Status", "dm_notes", "pm", "dm", "cp", "dp", "Agile Practices", "last_da_review", "last_ta_review", "development_languages_used", "client_category"]

    def initialize(projects_dashboard, week_ending)
      @dashboard_data = projects_dashboard
      @week_ending = week_ending
    end

    def to_excel
      excel = Excel.new
      excel.create_row_with ["Week Ending", @week_ending]

      excel.create_row_with ["Project Name"] + REPORT_COLUMN_HEADERS

      populate_dashboard_iteration_information(excel)
      excel.write_to_file("#{@week_ending.gsub("/", "-")}.xls")
      excel.path
    end

    private

    def populate_dashboard_iteration_information(excel)
      @dashboard_data.each do |project|
        excel.create_row_with_comments(
                REPORT_COLUMN_PROPERTIES.inject([[project.name, ""]]) { |info, prop|
                  data = project.get_data(prop)
                  info << [data[:value], data[:comment]]
                  info
                }
        )
      end
    end
  end
end
