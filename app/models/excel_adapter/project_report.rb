module ExcelAdapter
  class ProjectReport
    attr_accessor :project

    def initialize(project)
      @project = project
    end

    def to_excel
      Axlsx::Package.new do |p|
        p.workbook.add_worksheet(:name => "Details") do |sheet|
          populate_project_properties(sheet)
          populate_iterations(sheet)
          sheet.column_widths *([20]*sheet.column_info.count)
        end
        p.use_shared_strings = true
        return p.to_stream
      end
    end

    private
    def populate_project_properties(sheet)
      @project.project_properties.each do |key, value|
        sheet.add_row([key.humanize, value])
      end
    end

    def populate_iterations(sheet)
      first_iteration = @project.iterations[0]
      header_row = sheet.add_row(["Week"] + first_iteration.metrics.collect(& :name) + ["DM Notes"]) if !(first_iteration.nil? || first_iteration.empty?)
      @project.iterations.each_with_index do |iteration, index|
        cell_count=0
        data_row = sheet.add_row([""] * header_row.cells.count)
        iteration_info = [[iteration.date, ""]] +
                         iteration.metrics.inject([]) { |pair, metric| pair << [metric[:value], metric[:comment]]; pair } + [[iteration.dm_notes, ""]]

        iteration_info.each do |pair|
          current_cell = data_row.cells[cell_count]
          current_cell.value = pair[0]
          sheet.add_comment :ref => current_cell.r, :author => "Author", :text => pair[1]
          cell_count = cell_count+1
        end
      end
    end
  end
end