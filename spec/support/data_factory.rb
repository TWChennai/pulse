class DataFactory
  def self.list_of_projects
    {
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
  end
  
  def self.project_properties
    {
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
       },
       "metrics" => {"scope"=>{"data"=>{"percentage_priority_scope"=>{"name"=>"Percentage of scope by priority", "tracked"=>"yes", "mandatory"=>"no", "order"=>"3", "description"=>"What was the breakup of the stories in scope by priority"}, "scope_change_other"=>{"name"=>"Scope Change - Other Factors", "tracked"=>"yes", "mandatory"=>"no", "order"=>"2", "description"=>"Scope changes not caused by additional stories"}, "scope_change"=>{"name"=>"Scope Change", "tracked"=>"yes", "mandatory"=>"no", "order"=>"1", "description"=>"Stories added or removed due to redundancy / Rewrite"}}, "metadata"=>{"name"=>"Scope", "order"=>"2"}}, "story_tracking"=>{"data"=>{"stories_carried_over"=>{"name"=>"Stories carried Over", "tracked"=>"yes", "mandatory"=>"no", "order"=>"2", "description"=>"User Stories carried forward(hangover)"}, "story_rate"=>{"name"=>"Story Rate", "tracked"=>"no", "mandatory"=>"no", "order"=>"1", "description"=>"Rate of story completion per developer per iteration"}, "no_of_stories_in_scope"=>{"name"=>"No of stories in Scope", "tracked"=>"yes", "mandatory"=>"no", "order"=>"3", "description"=>"Number of stories held in analysis/testing"}}, "metadata"=>{"name"=>"Story Tracking", "order"=>"3"}}, "build_stats"=>{"data"=>{"broken_builds_per_iteration"=>{"name"=>"Number of Broken Builds Per Iteration", "tracked"=>"no", "mandatory"=>"no", "order"=>"4", "description"=>"Average count of Broken Builds per Iteration"}, "average_duration_of_broken_build"=>{"name"=>"Average Duration Of Broken Build", "tracked"=>"no", "mandatory"=>"no", "order"=>"5", "description"=>"Average Duration of Broken Build Per Iteration"}, "average_duration_of_build"=>{"name"=>"Average Duration Of Build", "tracked"=>"no", "mandatory"=>"no", "order"=>"3", "description"=>"Average duration of builds per iteration"}, "number_of_builds_per_iteration"=>{"name"=>"Number of Buids Per Iteration", "tracked"=>"no", "mandatory"=>"no", "order"=>"1", "description"=>"Total Number Of Builds Per Iteration"}, "frequency_of_builds"=>{"name"=>"Frequency of Builds", "tracked"=>"no", "mandatory"=>"no", "order"=>"2", "description"=>"Frequency of Builds Per Iteration"}}, "metadata"=>{"name"=>"Build Stats", "order"=>"6"}}, "testing"=>{"data"=>{"functional_test_coverage"=>{"name"=>"Number Of Functional Tests", "tracked"=>"yes", "mandatory"=>"no", "order"=>"4", "description"=>"Total Number Of Functional Tests"}, "unit_test_coverage"=>{"name"=>"Unit Test Coverage", "tracked"=>"yes", "mandatory"=>"no", "order"=>"3", "description"=>"Percentage Of Unit Test Coverage"}, "unit_tests"=>{"name"=>"Number Of Unit Tests", "tracked"=>"yes", "mandatory"=>"no", "order"=>"1", "description"=>"Total Number Of Unit Tests"}, "functional_tests"=>{"name"=>"Number Of Functional Tests", "tracked"=>"yes", "mandatory"=>"no", "order"=>"2", "description"=>"Total Number Of Functional Tests"}}, "metadata"=>{"name"=>"Testing", "order"=>"4"}}, "defect_tracking"=>{"data"=>{"defects_per_story"=>{"name"=>"Defects Per Story", "tracked"=>"yes", "mandatory"=>"no", "order"=>"2", "description"=>"Average Number Of Defects Per Story"}, "defects_carried_over"=>{"name"=>"Defects Carried Over", "tracked"=>"yes", "mandatory"=>"no", "order"=>"1", "description"=>"Total Number Of Defects Carried Over"}}, "metadata"=>{"name"=>"Defect Tracking", "order"=>"5"}}, "technical"=>{"data"=>{"dist_method_class"=>{"name"=>"Distribution Of Method And Class File Length", "tracked"=>"no", "mandatory"=>"no", "order"=>"2", "description"=>"Pattern Of Distribution Of Methods And Classes"}, "rate_change_source"=>{"name"=>"Rate Of Change Of Source LOC in/LOC out", "tracked"=>"yes", "mandatory"=>"no", "order"=>"3", "description"=>"Rate At Which Source Code Is Being Changed"}, "cyclometric_complexity"=>{"name"=>"Cyclometric Complexity Measures", "tracked"=>"yes", "mandatory"=>"no", "order"=>"1", "description"=>"Level Of Cyclometric Complexity Present In The Code"}, "propotion_of_test_code"=>{"name"=>"Propotion Of Source Code That Is Test Code", "tracked"=>"yes", "mandatory"=>"no", "order"=>"4", "description"=>"What Percent Of Source Code Constitutes The Test Code "}}, "metadata"=>{"name"=>"Technical", "order"=>"7"}}, "general"=>{"data"=>{"scope"=>{"name"=>"Scope", "tracked"=>"yes", "mandatory"=>"yes", "order"=>"2", "description"=>"Is the scope well defined?"}, "commercial_status"=>{"name"=>"Commercial Status", "tracked"=>"yes", "mandatory"=>"yes", "order"=>"7", "description"=>"Current/Future SOW status"}, "utilization"=>{"name"=>"Utilization Factor", "tracked"=>"no", "mandatory"=>"no", "order"=>"10", "description"=>"Is the utilization good?"}, "cost"=>{"name"=>"Cost", "tracked"=>"yes", "mandatory"=>"yes", "order"=>"4", "description"=>"Is the Project spend on track?"}, "schedule"=>{"name"=>"Schedule", "tracked"=>"yes", "mandatory"=>"yes", "order"=>"3", "description"=>"Is the Project on schedule till date?"}, "customer_satisfaction"=>{"name"=>"Customer Satisfaction", "tracked"=>"yes", "mandatory"=>"yes", "order"=>"8", "description"=>"Is the customer satisfied about the work?"}, "team_satisfaction"=>{"name"=>"Team Satisfaction", "tracked"=>"yes", "mandatory"=>"yes", "order"=>"9", "description"=>"Is the team satisfied about the work?"}, "iteration_backlog"=>{"name"=>"Iteration Backlog", "tracked"=>"yes", "mandatory"=>"yes", "order"=>"5", "description"=>"Is there a good iteration backlog?"}, "overall_status"=>{"name"=>"Overall Status", "tracked"=>"yes", "mandatory"=>"yes", "order"=>"1", "description"=>"Status of the Project"}, "business_value"=>{"name"=>"Business Value / Production Release", "tracked"=>"no", "mandatory"=>"no", "order"=>"11", "description"=>"Business value delivered per production release"}, "agile_practices"=>{"name"=>"Agile Practices", "tracked"=>"yes", "mandatory"=>"yes", "order"=>"6", "description"=>"Communication Plan, Retros , Showcases "}}, "metadata"=>{"name"=>"General", "order"=>"1"}}}
    }
  end
  
  def self.properties_post_info
    {"sow_signed"=>{"date(1i)"=>"2010", "date(2i)"=>"3", "date(3i)"=>"30"}, "iteration_duration"=>"", "non_tenured_twers"=>"", "tenured_twers"=>"", "averate_estimate_per_story"=>"", "name"=>"Simon & Schuster sdf", "average_team_size"=>"", "senior_consultants"=>"hj", "consultants"=>"", "no_of_stories"=>"", "team_ratio"=>"kj", "discrete_teams_project"=>"khkj", "project_duration"=>"lk", "cri_classification"=>"lj", "development_languages_used"=>"", "last_da_review"=>{"date(1i)"=>"2010", "date(2i)"=>"3", "date(3i)"=>"30"}, "project_start_date"=>{"date(1i)"=>"2010", "date(2i)"=>"3", "date(3i)"=>"30"}, "team_size"=>"", "units_of_estimation"=>"", "onsite_offsite_mix"=>"j", "engagement_model"=>"", "location"=>""}    
  end
end