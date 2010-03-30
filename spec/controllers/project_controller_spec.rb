require 'spec_helper'

describe ProjectController do
  before(:each) do
    @project = {
       "_id"=> "b468620c69b34208e219a3f366adbfd1",
       "_rev"=> "1-570199a7b2f8cb952cf27a0f7e5f0b24",
       "properties"=> {
           "iteration_duration"=> {
               "name"=> "Iteration Duration",
               "order"=> "21",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "jk",
               "description"=> "Weeks/ Iteration"
           },
           "non_tenured_twers"=> {
               "name"=> "No of non Tenured Thoughtworkers",
               "order"=> "18",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "jhk",
               "description"=> "Non Tenured TWers are <1 year experienced"
           },
           "tenured_twers"=> {
               "name"=> "No of Tenured Thoughtworkers",
               "order"=> "17",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "jh",
               "description"=> "Tenured TWers are 1+ experienced"
           },
           "averate_estimate_per_story"=> {
               "name"=> "Average Estimate Per Story",
               "order"=> "15",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "jh",
               "description"=> "Average weight per story"
           },
           "sow_signed"=> {
               "name"=> "SOW Signed",
               "order"=> "3",
               "tracked"=> "yes",
               "type"=> "date",
               "value"=> "2010-03-29",
               "description"=> "Date on which SOW was signed"
           },
           "name"=> {
               "name"=> "Project Name",
               "order"=> "1",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "hjkjhh",
               "description"=> "Name of the Project"
           },
           "average_team_size"=> {
               "name"=> "Average Team Size",
               "order"=> "11",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "h",
               "description"=> "No of people on the project"
           },
           "senior_consultants"=> {
               "name"=> "No of Senior Consultant Thoughtworkers",
               "order"=> "20",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "jk",
               "description"=> "Senior Consultants are 2+ year experienced"
           },
           "consultants"=> {
               "name"=> "No of Consultant Thoughtworkers",
               "order"=> "19",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "jkh",
               "description"=> "Consultants are <2 year experienced"
           },
           "no_of_stories"=> {
               "name"=> "No of Stories",
               "order"=> "14",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "hjkh",
               "description"=> "Number of stories in the project"
           },
           "team_ratio"=> {
               "name"=> "Team Ratio",
               "order"=> "12",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "k",
               "description"=> "Team Ratio in the project"
           },
           "discrete_teams_project"=> {
               "name"=> "No of Discrete Teams in the Project",
               "order"=> "10",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "hj",
               "description"=> "No of Discrete Teams in the Project"
           },
           "project_duration"=> {
               "name"=> "Project Duration",
               "order"=> "9",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "j",
               "description"=> "Duration of the Project"
           },
           "cri_classification"=> {
               "name"=> "CRI Classification",
               "order"=> "8",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "jkjk",
               "description"=> "CRI classification of the project"
           },
           "development_languages_used"=> {
               "name"=> "Languages Used",
               "order"=> "16",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "kjjkh",
               "description"=> "Technologies used in project"
           },
           "last_da_review"=> {
               "name"=> "Last DA Review",
               "order"=> "5",
               "tracked"=> "yes",
               "type"=> "date",
               "value"=> "2010-03-29",
               "description"=> "Date on which the DA review was done"
           },
           "project_start_date"=> {
               "name"=> "Project Start Date",
               "order"=> "4",
               "tracked"=> "yes",
               "type"=> "date",
               "value"=> "2010-03-29",
               "description"=> "The date on which the project started"
           },
           "team_size"=> {
               "name"=> "Team size",
               "order"=> "16",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "jh",
               "description"=> "Number of memebers in the project"
           },
           "units_of_estimation"=> {
               "name"=> "Unit used for Estimation",
               "order"=> "13",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "kj",
               "description"=> "What kind of points are used for estimation?"
           },
           "onsite_offsite_mix"=> {
               "name"=> "Onsite/Offsite Mix",
               "order"=> "7",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "hj",
               "description"=> "No of People in Offsite vs Onsite"
           },
           "engagement_model"=> {
               "name"=> "Engagement Model",
               "order"=> "6",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "jkhjkh",
               "description"=> "Fixed Bid or Variable Bid"
           },
           "location"=> {
               "name"=> "Location",
               "order"=> "2",
               "tracked"=> "yes",
               "type"=> "string",
               "value"=> "jkkj",
               "description"=> "Location of the project"
           }
       }
    }
  end
  describe "show page" do
    integrate_views
    it "should show error page if project does not exist" do
      Project.should_receive(:find).with("12345").and_raise(RestClient::ResourceNotFound)
      @controller.should_receive(:render).with(:template=>'public/404.html')
      get :show, :id=> "12345"
      response.should be
    end

    it "should show the project page if the project exists" do
      Project.should_receive(:find).with("20").and_return(@project)
      get :show, :id=>"20"
      response.should be
      response.should have_tag("div#project") do 
        with_tag("div#name",/Project Name/)
      end
    end
  end
  
  describe "edit page" do
    it "should description" do
      
    end
  end
  
end