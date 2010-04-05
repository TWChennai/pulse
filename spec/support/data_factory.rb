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
    Project.new({"name"=>"default", "metrics"=>{"nameAverage Duration Of Buildtrackednoorder3mandatorynodescriptionAverage duration of builds per iterationcouchrest-typeMetricData"=>"yes", "nameNumber of Buids Per Iterationtrackednoorder1mandatorynodescriptionTotal Number Of Builds Per Iterationcouchrest-typeMetricData"=>"yes", "nameFrequency of Buildstrackednoorder2mandatorynodescriptionFrequency of Builds Per Iterationcouchrest-typeMetricData"=>"yes"}, "properties"=>{"iteration_duration"=>"hj", "non_tenured_twers"=>"hj", "tenured_twers"=>"jh", "averate_estimate_per_story"=>"hj", "sow_signed"=>"04/21/2010", "average_team_size"=>"jh", "senior_consultants"=>"jh", "consultants"=>"hj", "no_of_stories"=>"hj", "team_ratio"=>"jhjh", "discrete_teams_project"=>"jhj", "project_duration"=>"jhjh", "cri_classification"=>"jhjh", "development_languages_used"=>"jhhj", "last_da_review"=>"04/22/2010", "project_start_date"=>"04/22/2010", "project_name"=>"& S&S", "team_size"=>"hj", "units_of_estimation"=>"jh", "onsite_offsite_mix"=>"jjhjh", "engagement_model"=>"jhj", "location"=>"jdsa"}, "couchrest-type"=>"Project"})
  end
  
  def self.properties_post_info
    {"sow_signed"=>{"date(1i)"=>"2010", "date(2i)"=>"3", "date(3i)"=>"30"}, "iteration_duration"=>"", "non_tenured_twers"=>"", "tenured_twers"=>"", "averate_estimate_per_story"=>"", "name"=>"Simon & Schuster sdf", "average_team_size"=>"", "senior_consultants"=>"hj", "consultants"=>"", "no_of_stories"=>"", "team_ratio"=>"kj", "discrete_teams_project"=>"khkj", "project_duration"=>"lk", "cri_classification"=>"lj", "development_languages_used"=>"", "last_da_review"=>{"date(1i)"=>"2010", "date(2i)"=>"3", "date(3i)"=>"30"}, "project_start_date"=>{"date(1i)"=>"2010", "date(2i)"=>"3", "date(3i)"=>"30"}, "team_size"=>"", "units_of_estimation"=>"", "onsite_offsite_mix"=>"j", "engagement_model"=>"", "location"=>""}    
  end
end