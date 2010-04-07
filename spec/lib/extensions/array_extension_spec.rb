require File.dirname(__FILE__) + '/../../spec_helper'

describe "ArrayExtension" do
  it "should self select the array" do
    array = (1..10).to_a
    array.select! {|ele| ele % 2 == 0}
    array.should == [2, 4, 6, 8, 10]
  end
end