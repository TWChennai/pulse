require File.dirname(__FILE__) + '/../../spec_helper'

describe "Object Extension" do
  it "should return true if the argument is a string true" do
    "true".to_bool.should == true
  end
  it "should return false if the argument is a string false" do
    "false".to_bool.should == false
  end
  it "should throw an illegal argument exception if its of any other type" do
    lambda{"a".to_bool}.should raise_error(ArgumentError)
  end
end