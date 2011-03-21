require 'csv'
require 'rubygems'
require 'rjb'

module CSVAdapter
  class Project
    attr_accessor :project

    def initialize(project)
      @project = project
      @apache_poi_path = File.join File.dirname(__FILE__), '../../../poi-3.7/poi-3.7-20110321.jar'
    end

    def to_excel
      Rjb::load("#{@apache_poi_path}", ['-Xms256M', '-Xmx512M'])
      file_class = Rjb::import('java.io.FileOutputStream')
      workbook_class = Rjb::import('org.apache.poi.hssf.usermodel.HSSFWorkbook')

      book = workbook_class.new
      sheet = book.createSheet(@project.name)
      sheet.setDefaultColumnWidth(20)

      populate_project_properties(sheet)
      populate_iterations(book, sheet)

      file_name = "#{@project.name}.xls"
      out = file_class.new(File.join File.dirname(__FILE__) + "/../../../", file_name)
      book.write(out)
      out.close
      file_name
    end

    private
    def populate_project_properties(sheet)
      @project.project_properties.each do |key, value|
        create_row_with(sheet, [key.humanize, value])
      end
    end

    def populate_iterations(book, sheet)
      @project.iterations.each_with_index do |iteration, index|
        create_row_with(sheet, ["Week"] + iteration.metrics.collect(& :name) + ["DM Notes"]) if index == 0
        row = create_row_with(sheet, [iteration.date])

        iteration.metrics.each do |metric|
          metric_col = row.createCell(row.getPhysicalNumberOfCells())
          metric_col.setCellValue(metric[:value])
          metric_col.setCellComment(create_comment(book, sheet, row, metric_col, metric[:comment])) if !metric[:comment].blank?
        end

        row.createCell(row.getPhysicalNumberOfCells()).setCellValue(iteration.dm_notes)
      end
    end

    def create_row_with(sheet, values)
      row = sheet.createRow(sheet.getPhysicalNumberOfRows() + 1)
      values.each { |value| row.createCell(row.getPhysicalNumberOfCells()).setCellValue(value) }
      row
    end

    def create_comment(book, sheet, row, cell, comment_str)
      factory = book.getCreationHelper()
      drawing = sheet.createDrawingPatriarch()
      anchor = factory.createClientAnchor()
      anchor.setCol1(cell.getColumnIndex())
      anchor.setCol2(cell.getColumnIndex()+1)
      anchor.setRow1(row.getRowNum())
      anchor.setRow2(row.getRowNum()+3)
      comment = drawing.createCellComment(anchor)
      str = factory.createRichTextString(comment_str)
      comment.setString(str)
      comment
    end

  end
end