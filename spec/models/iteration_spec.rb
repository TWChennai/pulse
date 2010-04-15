require File.dirname(__FILE__) + '/../spec_helper'
require 'tempfile'

describe Iteration do
  describe "take attachments" do
    it "should store files" do
      files = [temp_file_for_attachment("file_name.txt", "content")]
      iteration = Iteration.new(:file_attachments => files)
      iteration.file_attachments.map{|h| h[:name]}.should == ["file_name.txt"]
    end
  end

  def temp_file_for_attachment(name = "temp_file.txt", content = "default content")
    file = Tempfile.new(name + rand.to_s)
    file.rewind
    file.stub!(:original_filename).and_return(name)
    file
  end
end