module ExcelAdapter
  class Project
    attr_accessor :project

    def initialize(project)
      @project = project
    end

    def to_excel
      excel = Excel.new
      populate_project_properties(excel)
      populate_iterations(excel)

      excel.write_to_file("#{@project.name}.xls")
      excel.path
    end

    private
    def populate_project_properties(excel)
      @project.project_properties.each do |key, value|
        excel.create_row_with([key.humanize, value])
      end
    end

    def populate_iterations(excel)
      @project.iterations.each_with_index do |iteration, index|
        excel.create_row_with(["Week"] + iteration.metrics.collect(& :name) + ["DM Notes"]) if index == 0
        iteration_info = [[iteration.date, ""]] +
                iteration.metrics.inject([]) { |pair, metric| pair << [metric[:value], metric[:comment]]; pair } +
                [[iteration.dm_notes, ""]]
        excel.create_row_with_comments(iteration_info)
      end
    end
  end
end