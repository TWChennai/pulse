class ProjectTemplate < CouchRest::ExtendedDocument
  use_database COUCHDB_SERVER

  DESIGN_DOC = "_design/template"

  property :metrics_group, :cast_as => [MetricGroup]
  property :properties_group, :cast_as => [Property]
  property :name  

  def self.create
    COUCHDB_SERVER.save_doc({"_id"=> DESIGN_DOC,"properties_group"=>[{"name"=>"Project Name",
    "order"=>"1", "tracked"=>"yes", "type"=>"string", "description"=>"Name of the Project",
    "couchrest-type"=>"Property", "key"=>"project_name"}, {"name"=>"Location", "order"=>"2",
    "tracked"=>"yes", "type"=>"string", "description"=>"Location of the project",
    "couchrest-type"=>"Property", "key"=>"location"}, {"name"=>"SOW Signed", "order"=>"3",
    "tracked"=>"yes", "type"=>"date", "description"=>"Date on which SOW was signed",
    "couchrest-type"=>"Property", "key"=>"sow_signed"}, {"name"=>"Project Start Date", "order"=>"4",
    "tracked"=>"yes", "type"=>"date", "description"=>"The date on which the project started",
    "couchrest-type"=>"Property", "key"=>"project_start_date"}, {"name"=>"Last DA Review", "order"=>"5",
    "tracked"=>"yes", "type"=>"date", "description"=>"Date on which the DA review was done",
    "couchrest-type"=>"Property", "key"=>"last_da_review"}, {"name"=>"Engagement Model", "order"=>"6",
    "tracked"=>"yes", "type"=>"string", "description"=>"Fixed Bid or Variable Bid",
    "couchrest-type"=>"Property", "key"=>"engagement_model"}, {"name"=>"Onsite/Offsite Mix", "order"=>"7",
    "tracked"=>"yes", "type"=>"string", "description"=>"No of People in Offsite vs Onsite",
    "couchrest-type"=>"Property", "key"=>"onsite_offsite_mix"}, {"name"=>"CRI Classification",
    "order"=>"8", "tracked"=>"yes", "type"=>"string", "description"=>"CRI classification of the project",
    "couchrest-type"=>"Property", "key"=>"cri_classification"}, {"name"=>"Project Duration", "order"=>"9",
    "tracked"=>"yes", "type"=>"string", "description"=>"Duration of the Project",
    "couchrest-type"=>"Property", "key"=>"project_duration"}, {"name"=>"No of Discrete Teams in the
    Project", "order"=>"10", "tracked"=>"yes", "type"=>"string", "description"=>"No of Discrete Teams in
    the Project", "couchrest-type"=>"Property", "key"=>"discrete_teams_project"}, {"name"=>"Average Team
    Size", "order"=>"11", "tracked"=>"yes", "type"=>"string", "description"=>"No of people on the
    project", "couchrest-type"=>"Property", "key"=>"average_team_size"}, {"name"=>"Team Ratio",
    "order"=>"12", "tracked"=>"yes", "type"=>"string", "description"=>"Team Ratio in the project",
    "couchrest-type"=>"Property", "key"=>"team_ratio"}, {"name"=>"Unit used for Estimation",
    "order"=>"13", "tracked"=>"yes", "type"=>"string", "description"=>"What kind of points are used for
    estimation?", "couchrest-type"=>"Property", "key"=>"units_of_estimation"}, {"name"=>"No of Stories",
    "order"=>"14", "tracked"=>"yes", "type"=>"string", "description"=>"Number of stories in the project",
    "couchrest-type"=>"Property", "key"=>"no_of_stories"}, {"name"=>"Average Estimate Per Story",
    "order"=>"15", "tracked"=>"yes", "type"=>"string", "description"=>"Average weight per story",
    "couchrest-type"=>"Property", "key"=>"averate_estimate_per_story"}, {"name"=>"Languages Used",
    "order"=>"16", "tracked"=>"yes", "type"=>"string", "description"=>"Technologies used in project",
    "couchrest-type"=>"Property", "key"=>"development_languages_used"}, {"name"=>"Team size",
    "order"=>"16", "tracked"=>"yes", "type"=>"string", "description"=>"Number of memebers in the project",
    "couchrest-type"=>"Property", "key"=>"team_size"}, {"name"=>"No of Tenured Thoughtworkers",
    "order"=>"17", "tracked"=>"yes", "type"=>"string", "description"=>"Tenured TWers are 1+ experienced",
    "couchrest-type"=>"Property", "key"=>"tenured_twers"}, {"name"=>"No of non Tenured Thoughtworkers",
    "order"=>"18", "tracked"=>"yes", "type"=>"string", "description"=>"Non Tenured TWers are <1 year
    experienced", "couchrest-type"=>"Property", "key"=>"non_tenured_twers"}, {"name"=>"No of Consultant
    Thoughtworkers", "order"=>"19", "tracked"=>"yes", "type"=>"string", "description"=>"Consultants are <2
    year experienced", "couchrest-type"=>"Property", "key"=>"consultants"}, {"name"=>"No of Senior
    Consultant Thoughtworkers", "order"=>"20", "tracked"=>"yes", "type"=>"string", "description"=>"Senior
    Consultants are 2+ year experienced", "couchrest-type"=>"Property", "key"=>"senior_consultants"},
    {"name"=>"Iteration Duration", "order"=>"21", "tracked"=>"yes", "type"=>"string",
    "description"=>"Weeks/ Iteration", "couchrest-type"=>"Property", "key"=>"iteration_duration"}],
    "metrics_group"=>[{"name"=>"General", "order"=>"1", "couchrest-type"=>"MetricGroup",
    "data"=>[{"name"=>"Overall Status", "mandatory"=>"yes", "order"=>"1", "tracked"=>"yes",
    "description"=>"Status of the Project", "couchrest-type"=>"MetricData", "key"=>"overall_status"},
    {"name"=>"Scope", "mandatory"=>"yes", "order"=>"2", "tracked"=>"yes", "description"=>"Is the scope
    well defined?", "couchrest-type"=>"MetricData", "key"=>"scope"}, {"name"=>"Schedule",
    "mandatory"=>"yes", "order"=>"3", "tracked"=>"yes", "description"=>"Is the Project on schedule till
    date?", "couchrest-type"=>"MetricData", "key"=>"schedule"}, {"name"=>"Cost", "mandatory"=>"yes",
    "order"=>"4", "tracked"=>"yes", "description"=>"Is the Project spend on track?",
    "couchrest-type"=>"MetricData", "key"=>"cost"}, {"name"=>"Iteration Backlog", "mandatory"=>"yes",
    "order"=>"5", "tracked"=>"yes", "description"=>"Is there a good iteration backlog?",
    "couchrest-type"=>"MetricData", "key"=>"iteration_backlog"}, {"name"=>"Agile Practices",
    "mandatory"=>"yes", "order"=>"6", "tracked"=>"yes", "description"=>"Communication Plan, Retros ,
    Showcases ", "couchrest-type"=>"MetricData", "key"=>"agile_practices"}, {"name"=>"Commercial Status",
    "mandatory"=>"yes", "order"=>"7", "tracked"=>"yes", "description"=>"Current/Future SOW status",
    "couchrest-type"=>"MetricData", "key"=>"commercial_status"}, {"name"=>"Customer Satisfaction",
    "mandatory"=>"yes", "order"=>"8", "tracked"=>"yes", "description"=>"Is the customer satisfied about
    the work?", "couchrest-type"=>"MetricData", "key"=>"customer_satisfication"}, {"name"=>"Team
    Satisfaction", "mandatory"=>"yes", "order"=>"9", "tracked"=>"yes", "description"=>"Is the team
    satisfied about the work?", "couchrest-type"=>"MetricData", "key"=>"team_satisfaction"},
    {"name"=>"Utilization Factor", "mandatory"=>"no", "order"=>"10", "tracked"=>"no", "description"=>"Is
    the utilization good?", "couchrest-type"=>"MetricData", "key"=>"utilization_factor"},
    {"name"=>"Business Value / Production Release", "mandatory"=>"no", "order"=>"11", "tracked"=>"no",
    "description"=>"Business value delivered per production release", "couchrest-type"=>"MetricData",
    "key"=>"business_value"}]}, {"name"=>"Scope", "order"=>"2", "couchrest-type"=>"MetricGroup",
    "data"=>[{"name"=>"Scope Change", "mandatory"=>"no", "order"=>"1", "tracked"=>"no",
    "description"=>"Stories added or removed due to redundancy / Rewrite", "couchrest-type"=>"MetricData",
    "key"=>"scope_change"}, {"name"=>"Scope Change - Other Factors", "mandatory"=>"no", "order"=>"2",
    "tracked"=>"no", "description"=>"Scope changes not caused by additional stories",
    "couchrest-type"=>"MetricData", "key"=>"scope_change"}, {"name"=>"Percentage of scope by priority",
    "mandatory"=>"no", "order"=>"3", "tracked"=>"no", "description"=>"What was the breakup of the stories
    in scope by priority", "couchrest-type"=>"MetricData", "key"=>"percentage_of_scope_by_priority"}]},
    {"name"=>"Story Tracking", "order"=>"3", "couchrest-type"=>"MetricGroup", "data"=>[{"name"=>"Story
    Rate", "mandatory"=>"no", "order"=>"1", "tracked"=>"no", "description"=>"Rate of story completion per
    developer per iteration", "couchrest-type"=>"MetricData", "key"=>"story_rate"}, {"name"=>"Stories
    carried Over", "mandatory"=>"no", "order"=>"2", "tracked"=>"no", "description"=>"User Stories carried
    forward(hangover)", "couchrest-type"=>"MetricData", "key"=>"stories_carried_over"}, {"name"=>"No of
    stories in Scope", "mandatory"=>"no", "order"=>"3", "tracked"=>"no", "description"=>"Number of stories
    held in analysis/testing", "couchrest-type"=>"MetricData", "key"=>"no_of_stories_in_scope"}]},
    {"name"=>"Testing", "order"=>"4", "couchrest-type"=>"MetricGroup", "data"=>[{"name"=>"Number Of Unit
    Tests", "mandatory"=>"no", "order"=>"1", "tracked"=>"no", "description"=>"Total Number Of Unit Tests",
    "couchrest-type"=>"MetricData", "key"=>"number_of_unit_tests"}, {"name"=>"Number Of Functional Tests",
    "mandatory"=>"no", "order"=>"2", "tracked"=>"no", "description"=>"Total Number Of Functional Tests",
    "couchrest-type"=>"MetricData", "key"=>"number_of_functional_tests"}, {"name"=>"Unit Test Coverage",
    "mandatory"=>"no", "order"=>"3", "tracked"=>"no", "description"=>"Percentage Of Unit Test Coverage",
    "couchrest-type"=>"MetricData", "key"=>"unit_test_coverage"}, {"name"=>"Number Of Functional Tests",
    "mandatory"=>"no", "order"=>"4", "tracked"=>"no", "description"=>"Total Number Of Functional Tests",
    "couchrest-type"=>"MetricData", "key"=>"number_of_functional_tests"}]}, {"name"=>"Defect Tracking",
    "order"=>"5", "couchrest-type"=>"MetricGroup", "data"=>[{"name"=>"Defects Carried Over",
    "mandatory"=>"no", "order"=>"1", "tracked"=>"no", "description"=>"Total Number Of Defects Carried
    Over", "couchrest-type"=>"MetricData", "key"=>"defects_carried_over"}, {"name"=>"Defects Per Story",
    "mandatory"=>"no", "order"=>"2", "tracked"=>"no", "description"=>"Average Number Of Defects Per
    Story", "couchrest-type"=>"MetricData", "key"=>"defects_per_story"}]}, {"name"=>"Build Stats",
    "order"=>"6", "couchrest-type"=>"MetricGroup", "data"=>[{"name"=>"Number of Buids Per Iteration",
    "mandatory"=>"no", "order"=>"1", "tracked"=>"no", "description"=>"Total Number Of Builds Per
    Iteration", "couchrest-type"=>"MetricData", "key"=>"number_of_builds_per_iteration"},
    {"name"=>"Frequency of Builds", "mandatory"=>"no", "order"=>"2", "tracked"=>"no",
    "description"=>"Frequency of Builds Per Iteration", "couchrest-type"=>"MetricData",
    "key"=>"frequency_of_builds"}, {"name"=>"Average Duration Of Build", "mandatory"=>"no", "order"=>"3",
    "tracked"=>"no", "description"=>"Average duration of builds per iteration",
    "couchrest-type"=>"MetricData", "key"=>"average_duration_of_build"}, {"name"=>"Number of Broken Builds
    Per Iteration", "mandatory"=>"no", "order"=>"4", "tracked"=>"no", "description"=>"Average count of
    Broken Builds per Iteration", "couchrest-type"=>"MetricData",
    "key"=>"number_of_broken_builds_per_iteration"}, {"name"=>"Average Duration Of Broken Build",
    "mandatory"=>"no", "order"=>"5", "tracked"=>"no", "description"=>"Average Duration of Broken Build Per
    Iteration", "couchrest-type"=>"MetricData", "key"=>"average_duration_of_broken_build"}]},
    {"name"=>"Technical", "order"=>"7", "couchrest-type"=>"MetricGroup", "data"=>[{"name"=>"Cyclometric
    Complexity Measures", "mandatory"=>"no", "order"=>"1", "tracked"=>"no", "description"=>"Level Of
    Cyclometric Complexity Present In The Code", "couchrest-type"=>"MetricData",
    "key"=>"cyclometric_complexity_measures"}, {"name"=>"Distribution Of Method And Class File Length",
    "mandatory"=>"no", "order"=>"2", "tracked"=>"no", "description"=>"Pattern Of Distribution Of Methods
    And Classes", "couchrest-type"=>"MetricData", "key"=>"distribution_of_method_and_class_lengths"},
    {"name"=>"Rate Of Change Of Source LOC in/LOC out", "mandatory"=>"no", "order"=>"3", "tracked"=>"no",
    "description"=>"Rate At Which Source Code Is Being Changed", "couchrest-type"=>"MetricData",
    "key"=>"rate_of_change_of_source"}, {"name"=>"Propotion Of Source Code That Is Test Code",
    "mandatory"=>"no", "order"=>"4", "tracked"=>"no", "description"=>"What Percent Of Source Code
    Constitutes The Test Code ", "couchrest-type"=>"MetricData",
    "key"=>"proportion_of_source_code_that_is_test_code"}]}],
    "couchrest-type" => "ProjectTemplate"
    })
  end

  def self.project_template
    get DESIGN_DOC
  end
end