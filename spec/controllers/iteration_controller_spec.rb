require 'spec_helper'
describe IterationController do
  before(:each) do
    @project = DataFactory.project
  end

  describe "new" do
    it "should show a form to enter metrics for the new iteration" do
      get :new, :project_id => @project.id
      assigns[:project].should == @project
      assigns[:project_template].should == ProjectTemplate.project_template
    end

    it "should create a new iteration information with the metric template" do
      @project.iterations.size.should == 0
      post :save, :project_id => @project.id, 
                            :iteration => {
                              :date => 10.days.ago.to_date,
                              :metrics => [
                                {:name => "Metric1", :value => Metric::Value::RED, :comment => "This is a comment"},
                                {:name => "Metric2", :value => Metric::Value::GREEN, :comment => "This is also a comment"}
                              ],
                            },
                              :notes =>"This is a note "
      @project = Project.get(@project.id)
      @project.iterations.size.should == 1
      iteration = @project.iterations[0]
      iteration.date.should == 10.days.ago.to_date.to_s
      iteration.metrics.size.should == 2
      iteration.notes.should=="This is a note "
      metric1 = iteration.metrics[0]
      metric1.name.should == "Metric1"
      metric1.value.should == Metric::Value::RED
      metric1.comment.should == "This is a comment"
    end
  end

  describe "update" do
    it "should update the iteration information" do
      iteration = Iteration.new(:date => 10.days.ago, :metrics => [Metric.new(:name => "Metric1", :value => Metric::Value::GREEN, :comment => "Comment")],:notes=> "This is a note")
      @project.iterations << iteration
      @project.save!

      post :update, :project_id => @project.id,
                              :index => 0,
                              :iteration => {
                                :date => 10.days.ago.to_date,
                                :metrics => [
                                  {:name => "Metric1", :value => Metric::Value::RED, :comment => "This is the comment"},
                                ]
                              },
                                :notes=> "New Note"
      @project = Project.get(@project.id)
      iteration = @project.iterations[0]
      metric1 = iteration.metrics[0]
      metric1.value.should == Metric::Value::RED
      metric1.comment.should == "This is the comment"
      iteration.notes.should=="New Note"
    end
  end

end
