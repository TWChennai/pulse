class Project < CouchRest::ExtendedDocument
  include CouchRest::Validation
  use_database COUCHDB_SERVER
  module ISAlive
    OPEN = "Open"
    CLOSED = "Closed"
  end

  TYPES = [[Project::ISAlive::OPEN , true], [Project::ISAlive::CLOSED,false]]

  property :metrics
  property :project_properties

  property :additional_metrics, :cast_as => [MetricData]

  property :iterations, :cast_as => [Iteration]
  property :risks, :cast_as => [Risk]
  property :name
  property :isAlive
  property :location
  property :filtered_metrics
  view_by :list,
  :map => 
  "function(doc) {
  if (doc['couchrest-type'] == 'Project') {
    emit(doc.isAlive, doc.name);
  }
  }"

  view_by :location,
  :map => 
  "function(doc) {
  if (doc['couchrest-type'] == 'Project') {
    emit([doc.isAlive, doc.location],  doc);
  }
  }", 
  :reduce => 
  "function(keys,values){ 
  var returnDocs = [];
  for(value in values)
    {
      var returnDoc = [];
      var valueInUse = values[value];
      if(valueInUse['_id'] && valueInUse['name']) {
        returnDoc.push(valueInUse['_id'],valueInUse['name']);
        returnDocs.push(returnDoc);}
      }
      return returnDocs;
      }"

      view_by :dashboard, 
      :map => 
      "function(doc) {
      if (doc['couchrest-type'] == 'Project') {
        if(doc.iterations) {
          for(store in doc.iterations) {
            emit([doc.isAlive, doc.iterations[store].date],doc.iterations[store]);
          }
        }
      }
    }
    "
    view_by :metric, 
    :map => "

    function(doc) { 
      if (doc['couchrest-type'] == 'Project') {
        if(doc.iterations){
          for(store in doc.iterations) {
            if(doc.iterations[store].metrics) {
              for(metric in doc.iterations[store].metrics) {
                emit([doc.isAlive, doc.iterations[store].metrics[metric].name,Date.parse(doc.iterations[store].date)/1000],[doc._id, doc.iterations[store].metrics[metric]])
              }
            }
          }
        }
      }
      }"
  
      
      validates_presence_of :name

      def initialize(*args)
        self.project_properties = {}
        self.metrics = []
        self.iterations = []
        self.risks = []
        self.isAlive = true
        super(*args)
      end

      def self.projects_grouped_by_location
        @all_active_projects = Project.view("by_list",:key => true,:include_docs => true)
        grouped_projects = @all_active_projects.group_by(&:location)
        projects_group = []
        grouped_projects.each do |location,value|
          projects_group << DAL::ProjectsGroup.new(location, value.map{|project| Project.new(:_id => project['_id'], :name => project['name'])}.flatten)
        end
        return projects_group

        # projects_group = []
        # Project.view("by_location", :startkey => [true,""], :endkey => [true,{}], :reduce => true, :group => true, :group_level => 2)["rows"].each do |location_group|
        #   projects_group << DAL::ProjectsGroup.new(location_group["key"][1], location_group["value"].map{|project| Project.new(:_id => project[0], :name => project[1])}.flatten)
        # end
        # return projects_group
      end

      def additional_metrics
        self["additional_metrics"] || []
      end

      def all_metrics
        metric_list=[]
        iterations.each do |iteration|
          iteration.metrics.each do |metric|
            if !metric_list.include?(metric.name)
              metric_list<<metric.name
            end
          end
        end
        metric_list
      end

      def stuff_properties
        ProjectTemplate.project_template.properties_group.map do |property|
          {
            :key => property.key,
            :name => property.name,
            :description => property.description, 
            :value => self.project_properties[property.key]
          }
        end
      end

      def stuffed_metrics
        ProjectTemplate.project_template.metrics_group.map do |metrics_group_from_template|
          metrics_group = metrics_group_from_template.clone
          metrics_group.data.select{|metric_hash| 
            metric_hash["mandatory"] || metrics.include?(metric_hash["key"])
          }
        end.flatten + self.additional_metrics.select{|a_m| a_m if self.metrics.include?(a_m.key)}
      end

      def metric_for_week(project_status, projects_metric_view,metric,week)
        projects_metric_view["rows"].each do |metric_view|
          if metric_view["key"] == [project_status, metric, week.to_time.to_i]
            if metric_view["id"] == self.id
              return {
                :comment => metric_view["value"][1]["comment"].downcase,
                :value => metric_view["value"][1]["value"].downcase
              }
            end
          end
        end
        return {
          :comment => "No data found.",
          :value => "undefined"
        }
      end
      def self.closed_projects
        @projects = Project.view("by_list", :key => false)
      end
      def self.open_projects
        @projects = Project.view("by_list", :key => true) 
      end
      def self.project_dashboard(project_status,week_ending_date)
        Project.view("by_dashboard",{:startkey => [project_status, week_ending_date], :endkey => [project_status,week_ending_date]})
      end
      def self.location_present
        locations=[]
        locations<<["All","all"]
        Project.projects_grouped_by_location.each do |location_group|
          locations<<[location_group.location,location_group.location]
        end
        locations
      end
      
end
    
