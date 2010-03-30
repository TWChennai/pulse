class DataFactory
  def self.list_of_projects
    projects_list =  {
      "rows"=>[
        {"id"=>"17eaedcf8c51679afc3fe056a6d2a3c2", "value"=>"hk", "key"=>"17eaedcf8c51679afc3fe056a6d2a3c2"}, 
        {"id"=>"353dd5036585b6cb242d0a430d64e066", "value"=>"hsjgdfkhasd", "key"=>"353dd5036585b6cb242d0a430d64e066"}, 
        {"id"=>"3de60a7802b9a68d023bf97dac7b3819", "value"=>"j", "key"=>"3de60a7802b9a68d023bf97dac7b3819"}, 
        {"id"=>"6b4642f37558391af4dd3c33a9e7fd96", "value"=>"hsjgdfkhasd", "key"=>"6b4642f37558391af4dd3c33a9e7fd96"}, 
        {"id"=>"6e85c9ce574c19bac1bd873a0c53d09e", "value"=>"kjh", "key"=>"6e85c9ce574c19bac1bd873a0c53d09e"}, 
        {"id"=>"76f2704dab39864e5884787817a89f3b", "value"=>"hsjgdfkhasd", "key"=>"76f2704dab39864e5884787817a89f3b"}, 
        {"id"=>"81ee19c14162f830d47901f843bf7ca3", "value"=>"hsjgdfkhasd", "key"=>"81ee19c14162f830d47901f843bf7ca3"},
        {"id"=>"8e52fbeba20c8857941ad04cd2dedfd6", "value"=>"hsjgdfkhasd", "key"=>"8e52fbeba20c8857941ad04cd2dedfd6"}, 
        {"id"=>"9a9d8ffecec500261b3725ad27be2bb0", "value"=>"hsjgdfkhasd", "key"=>"9a9d8ffecec500261b3725ad27be2bb0"}, 
        {"id"=>"b468620c69b34208e219a3f366adbfd1", "value"=>"hjkjhh", "key"=>"b468620c69b34208e219a3f366adbfd1"}
        ], 
        "offset"=>0, 
        "total_rows"=>10
      }
    return projects_list
  end
  def self.project_properties
    project = {
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
    return project
  end
  def self.properties_post_info
    @post_properties = {"sow_signed"=>{"date(1i)"=>"2010", "date(2i)"=>"3", "date(3i)"=>"30"}, "iteration_duration"=>"", "non_tenured_twers"=>"", "tenured_twers"=>"", "averate_estimate_per_story"=>"", "name"=>"Simon & Schuster sdf", "average_team_size"=>"", "senior_consultants"=>"hj", "consultants"=>"", "no_of_stories"=>"", "team_ratio"=>"kj", "discrete_teams_project"=>"khkj", "project_duration"=>"lk", "cri_classification"=>"lj", "development_languages_used"=>"", "last_da_review"=>{"date(1i)"=>"2010", "date(2i)"=>"3", "date(3i)"=>"30"}, "project_start_date"=>{"date(1i)"=>"2010", "date(2i)"=>"3", "date(3i)"=>"30"}, "team_size"=>"", "units_of_estimation"=>"", "onsite_offsite_mix"=>"j", "engagement_model"=>"", "location"=>""}    
    return @post_properties
  end
end