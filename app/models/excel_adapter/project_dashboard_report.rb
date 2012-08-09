module ExcelAdapter
  
  class ProjectDashboardReport
    REPORT_COLUMN_HEADERS = ["Region", "Client", "Report Date", "Project Start Date", "Expected Finish Date", "Exec Sponsor", "CP", "DP", "TP", "PM", "BCS Classification", "Location", "Team Size", "Tech Stack"]
    REPORT_COLUMN_PROPERTIES = ["sales_region", "client", "latest_iteration_submitted_date", "project_start_date", "expected_finish_date", "exec_sponsor", "cp", "dp", "tp", "pm", "bcs_classification", "location", "team_size", "development_languages_used"]

    def initialize(projects_dashboard, week_ending)
      @dashboard_data = projects_dashboard
      @week_ending = week_ending
    end

    def to_excel
      excel = Excel.new
      excel.create_row_with ["Week Ending", @week_ending]
      excel.create_row_with ["Project Name"] + REPORT_COLUMN_HEADERS + ProjectTemplate.mandatory_metrics.collect {|metric| metric.name} + ["Notes"]

      populate_dashboard_iteration_information(excel)
      excel.write_to_file("#{@week_ending.gsub("/", "-")}.xls")
      excel.path
    end

    private

    def populate_dashboard_iteration_information(excel)
     
	 @dashboard_data.each do |project|
	  	project_data = REPORT_COLUMN_PROPERTIES.inject([[project.name, ""]]) { |info, prop|
                  data = project.get_data(prop)
                  info << [data[:value], data[:comment]]
                  info
            }
		latest_iteration = project.latest_iteration_submitted
		if(!latest_iteration.nil?)
			latest_iteration.mandatory_metrics.each do|metric|
				project_data << [metric.value.downcase, metric.comment]
			end
			project_data << [latest_iteration.notes, ""]
		end
        excel.create_row_with_comments(project_data)
      end
	  
    end

  end

end
