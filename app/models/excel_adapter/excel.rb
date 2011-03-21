require 'rubygems'
require 'rjb'

module ExcelAdapter
  class Excel
    ROOT_PATH = File.join File.dirname(__FILE__) + "/../../../"
    APACHE_POI_PATH = ROOT_PATH + "poi-3.7/poi-3.7-20110321.jar"

    def initialize
      Rjb::load(APACHE_POI_PATH, ['-Xms256M', '-Xmx512M'])
      @file_class = Rjb::import('java.io.FileOutputStream')
      workbook_class = Rjb::import('org.apache.poi.hssf.usermodel.HSSFWorkbook')

      @book = workbook_class.new
      @sheet = @book.createSheet("Project Details")
      @sheet.setDefaultColumnWidth(20)

    end

    def create_row_with_comments(values)
      row = @sheet.createRow(@sheet.getPhysicalNumberOfRows() + 1)
      values.each do |pair|
        metric_col = row.createCell(row.getPhysicalNumberOfCells())
        metric_col.setCellValue(pair[0])
        metric_col.setCellComment(create_comment(row, metric_col, pair[1])) if !pair[1].blank?
      end
    end

    def create_row_with(values)
      row = @sheet.createRow(@sheet.getPhysicalNumberOfRows() + 1)
      values.each { |value| row.createCell(row.getPhysicalNumberOfCells()).setCellValue(value) }
      row
    end

    def create_comment(row, cell, comment_str)
      factory = @book.getCreationHelper()
      drawing = @sheet.createDrawingPatriarch()
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

    def write_to_file(file_name)
      @file_name = file_name
      out = @file_class.new(ROOT_PATH + file_name)
      @book.write(out)
      out.close
    end

    def path
      ROOT_PATH + @file_name
    end
  end
end