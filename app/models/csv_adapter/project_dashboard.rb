require 'csv'
module CSVAdapter
  class ProjectDashboard
    def initialize(projects_dashboard,week_ending)
      @dashboard_data = projects_dashboard
      @week_ending = week_ending
    end
   
    def to_csv
      csv_stream do |csv|
        csv << ["Week Ending", @week_ending]
        csv << []
        csv << []
        get_dashboard_data(csv)
      end
    end

    private
    
    def get_dashboard_data(csv)
      get_dashboard_header(csv)
      get_dashboard_iteration_information(csv)
    end
    
    def get_dashboard_header(csv)
      header = ["Project Name"]
      @dashboard_data.first.iterations.first.mandatory_metrics.each do |metric|
        header << metric.name
      end
      csv << header
    end
    
    def get_dashboard_iteration_information(csv)
      @dashboard_data.each do |project| 
        project_iteration_information = []
        project_comment_information = []
        project_iteration_information << project.name
        project_comment_information << "Comment"
        project.iterations.first.mandatory_metrics.each do |metric|
          project_iteration_information << metric.value.downcase
          project_comment_information << metric.comment
        end
        csv << project_iteration_information
        csv << project_comment_information
        csv << []
      end
    end

    #Extract out onto a new CSV Helper
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
