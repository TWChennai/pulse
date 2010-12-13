require File.dirname(__FILE__) + '/../spec_helper'

describe Project do
  describe "metric groups for the current project" do
    it "should return nil when comment or value is invoked on metric data" do
      metric_data = MetricData.new
      metric_data.value == nil
      metric_data.comment == nil
    end
  end

end