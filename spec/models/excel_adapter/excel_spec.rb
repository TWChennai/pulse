require File.dirname(__FILE__) + '/../../spec_helper'

module ExcelAdapter
  describe Excel do
    it "should add new row in excel with given values" do
      excel = Excel.new
      excel.create_row_with ["name", "duration", "size"]
      excel.sheet.getPhysicalNumberOfRows().should == 1
      excel.sheet.getRow(1).getPhysicalNumberOfCells().should == 3
      excel.sheet.getRow(1).getCell(0).getStringCellValue().should == "name"
      excel.sheet.getRow(1).getCell(1).getStringCellValue().should == "duration"
      excel.sheet.getRow(1).getCell(2).getStringCellValue().should == "size"
    end
  end
end