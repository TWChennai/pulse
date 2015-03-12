module ExcelAdapter

  class ProjectDashboardReport
    REPORT_COLUMN_HEADERS = ["Region", "Client", "Report Date", "Project Start Date", "Expected Finish Date", "Exec Sponsor", "CP", "DP", "TP", "PM", "BCS Classification", "Location", "Team Size", "Tech Stack"]
    REPORT_COLUMN_PROPERTIES = ["sales_region", "client", "latest_iteration_submitted_date", "project_start_date", "expected_finish_date", "exec_sponsor", "cp", "dp", "tp", "pm", "bcs_classification", "location", "team_size", "development_languages_used"]

    def initialize(projects_dashboard, week_ending)
      @dashboard_data = projects_dashboard
      @week_ending = week_ending
    end

    def to_excel
      Axlsx::Package.new do |p|
        p.workbook.add_worksheet(:name => "Dashboard_Details") do |sheet|
          populate_dashboard_iteration_information(sheet)
          sheet.column_widths *([20]*sheet.column_info.count)
        end
        p.use_shared_strings = true
        return p.to_stream
      end
    end

    private

    def populate_dashboard_iteration_information(sheet)

      sheet.add_row ["Week Ending", @week_ending]
      sheet.add_row ["Project Name"] + REPORT_COLUMN_HEADERS + ProjectTemplate.mandatory_metrics.collect { |metric| metric.name } + ["Notes"]

      @dashboard_data.each do |project|
        latest_iteration = project.get_closest_iteration_by_date(Date.parse(@week_ending).strftime("%m/%d/%Y"))
        if (!latest_iteration.nil?)
          project_data = REPORT_COLUMN_PROPERTIES.inject([project.name]) do |info, prop|
            data = project.get_data(prop)
            info << data[:value]
          end

          latest_iteration.mandatory_metrics.each do |metric|
            metric_details = metric.value
            if(!metric.comment.empty?)
              metric_details += ", " + metric.comment
            end
            project_data << metric_details
          end
          project_data << latest_iteration.notes
          sheet.add_row(project_data)
        end
      end
    end


  end

end
