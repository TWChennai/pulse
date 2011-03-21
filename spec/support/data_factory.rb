class DataFactory
  class <<self
    def list_of_projects
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

    def project(options = {})
      default_options = {
        "name" => "default_project",
        "metrics" => mandatory_metrics,
        "project_properties" => properties,
        "couchrest-type" => "Project"
      }

      options.reverse_merge!(default_options)
      Project.create! options
    end

    def feedbacks
      {
        "email" => "someone@thoughtworks.com",
        "changes" => "clone weekly status",
        "reason"=> "easy work"
      }
    end

    def risk
      {
        "risk_to_problem_indicator"=>"Simple",
        "start_date"=>"12/01/2010", 
        "mitigation"=>"I am trying to solve the problem",
        "risk_description"=>"Super Risk",
        "probability_of_occurrence"=>"High", 
        "impact"=>"High", "type_of_risk"=>"", 
        "owner"=>"Arvind Kunday",
        "couchrest-type" => "Risk",
        "state"=>"Open"}
    end

    def properties_post_info
      {
        "name" => "simon",
        "location" => "chennai",
        "project_properties"=>{"sow_signed"=>"04/21/2010", "averate_estimate_per_story"=>"hj", "tenured_twers"=>"jh",
                               "non_tenured_twers"=>"hj", "iteration_duration"=>"hj", "average_team_size"=>"jh", "team_ratio"=>"jhjh",
                                "no_of_stories"=>"hj", "consultants"=>"hj", "senior_consultants"=>"jh", "discrete_teams_project"=>"jhj",
                                 "cri_classification"=>"jhjh", "project_duration"=>"jhjh", "development_languages_used"=>"jhhj",
                                 "project_name"=>"& S&S", "project_start_date"=>"04/22/2010", "last_da_review"=>"04/22/2010",
                                  "units_of_estimation"=>"jh", "team_size"=>"hj", "onsite_offsite_mix"=>"jjhjh",
                                   "engagement_model"=>"jhj", "location"=>"my rocke"},
        "metrics" => mandatory_metrics.inject({}){|hash, metric| hash[metric] = true; hash}
      }
    end

    def properties
      {"iteration_duration"=>"hj", "non_tenured_twers"=>"hj", "tenured_twers"=>"jh", "averate_estimate_per_story"=>"hj",
        "sow_signed"=>"04/21/2010", "average_team_size"=>"jh", "senior_consultants"=>"jh", "consultants"=>"hj",
         "no_of_stories"=>"hj", "team_ratio"=>"jhjh", "discrete_teams_project"=>"jhj", "project_duration"=>"jhjh",
          "cri_classification"=>"jhjh", "development_languages_used"=>"jhhj", "last_da_review"=>"04/22/2010",
           "project_start_date"=>"04/22/2010", "project_name"=>"& S&S", "team_size"=>"hj", "units_of_estimation"=>"jh",
            "onsite_offsite_mix"=>"jjhjh", "engagement_model"=>"jhj", "location"=>"jdsa", "delivery_status" => "Better",
             "cp" => "Julia", "dp" => "Don", "pm" => "Dan", "dm" => "hu", "client" => "Zee",
              "client_category" => "Harvest", "region" => "Oz"}
    end

    def all_metrics
      all_metrics_hash.map {|hash| hash["key"]}
    end

    def mandatory_metrics
      mandatory_metrics_hash.map {|hash| hash["key"]}
    end

    def non_mandatory_metrics
      all_metrics - mandatory_metrics
    end

    def all_metrics_hash
      ProjectTemplate.metrics_group_from_json.collect do |group|
        group["data"]
      end.flatten
    end

    def mandatory_metrics_hash
      all_metrics_hash.select{|metric| metric["mandatory"]}
    end

    def create_projects_with_status
      projects = []
      projects << DataFactory.project(:isAlive => false)
      projects << DataFactory.project(:isAlive => true)
      return projects
    end

  end
end
