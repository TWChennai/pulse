require 'spec_helper'

describe RiskController do
  describe "#new" do
    it "should get the new risk template" do
      project = DataFactory.project
      get :new, :project_id => project.id
      assigns[:project].should == project
      assigns[:risk].should be
      response.should render_template(:new)
    end
  end
  describe "#save" do
    it "should save the risk object" do
      project = DataFactory.project
      old_val = Project.get(project.id).risks.size
      post :save, :project_id => project.id, :risk => DataFactory.risk
      (Project.get(project.id).risks.size - old_val).should == 1
      response.should redirect_to(project_path(project))
    end
  end
  describe "#edit" do
    it "should edit the existing risk information" do
      project = DataFactory.project
      risk = Risk.new(DataFactory.risk)
      risk.histories << {"abc" => "High", "couchrest-type" => "RiskHistory"}
      project.risks << risk
      project.save!
      get :edit, :project_id => project.id, :index => 0
      assigns[:project].risks[0].should == risk
      assigns[:risk_variations].first["abc"].should == "High"
      response.should render_template(:edit)
    end
  end
  describe "#update" do
    it "should update the correct risk object" do
      Timecop.freeze(Time.parse("23-Dec-2010")) do
        project = DataFactory.project
        risk = Risk.new(DataFactory.risk)
        project.risks << risk
        project.save!
        old_val = project.risks.count
        old_histories_value = risk["histories"].size
        post :update, :project_id => project.id, :index => 0, :risk => DataFactory.risk.merge!({"probability_of_occurrence" => "Closed"})
        project = Project.get(project.id)
        (old_val - project.risks.count).should == 0
        (project.risks.first["histories"].size - old_histories_value).should == 1
        project.risks.first.sort.should == DataFactory.risk.merge!({"date_modified" => "23-Dec-2010", "probability_of_occurrence" => "Closed","histories"=>[{"date_modified"=>"23-Dec-2010", "probability_of_occurrence" => "Closed" ,"couchrest-type"=>"RiskHistory"}]}).sort
      end
    end
  end
end
