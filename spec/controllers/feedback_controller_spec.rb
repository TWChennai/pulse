require 'spec_helper'

describe FeedbackController do

  describe "view" do
    it "should show a form that shows all the feedbacks" do
      get :view
      assigns[:feedbacks].should==Feedback.all_feedback
      response.should be
    end
  end

  describe "give" do
    it "should show a page to give feedback" do
      get :give
      assigns[:title].should=="Please Give Us Your Feedback"
      response.should be
    end
  end

  describe "submit" do
    it "should save a feedback with email,changes and reasons" do
      post :submit, :email=>"someone@thoughtworks.com",:changes=> "easter egg", :reasons=>"lazy"
      @feedbacks=Feedback.all_feedback
      @feedbacks.first.email.should=="someone@thoughtworks.com"
      @feedbacks.first.changes_required.should=="easter egg"
      @feedbacks.first.reason_for_changes.should=="lazy"
      flash[:success].should=="Your Feedback has been saved"
      response.should redirect_to(:action => 'give')
    end

    it "should not save a feedback without email,changes and reasons" do
      post :submit, :email=>"",:changes=> "", :reasons=>""
      flash[:error].should=="Please Fill In All the Details"
      response.should redirect_to(:action => 'give')
    end
  end

end
