class Project < CouchRest::ExtendedDocument
  use_database COUCHDB_SERVER

  property :metrics
  property :properties

  property :additional_metrics, :cast_as => [MetricData]

  property :iterations, :cast_as => [Iteration]
  property :name
  property :isAlive

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
    if(doc.properties) { 
      emit(doc.properties.location,  doc);
    }
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
            emit(doc.iterations[store].date,doc.iterations[store]);
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
                emit([doc.iterations[store].metrics[metric].name,Date.parse(doc.iterations[store].date)/1000],[doc._id, doc.iterations[store].metrics[metric]])
              }
            }
          }
        }
      }
      }"

      def initialize(*args)
        self.properties = {}
        self.metrics = []
        self.iterations = []
        self.isAlive = true
        super(*args)
      end

      def self.projects_grouped_by_location
        projects_group = []
        Project.view("by_location", :reduce => true, :group => true, :group_level => 2)["rows"].each do |location_group|
          projects_group << DAL::ProjectsGroup.new(location_group["key"], location_group["value"].map{|project| Project.new(:_id => project[0], :name => project[1])}.flatten)
        end
        return projects_group
      end

      def additional_metrics
        self["additional_metrics"] || []
      end

      def stuff_properties
        ProjectTemplate.project_template.properties_group.map do |property|
          {
            :key => property.key,
            :name => property.name,
            :description => property.description, 
            :value => self.properties[property.key]
          }
        end
      end

      def stuffed_metrics
        ProjectTemplate.project_template.metrics_group.map do |metrics_group_from_template|
          metrics_group = metrics_group_from_template.clone
          metrics_group.data.select{|metric_hash| 
            metric_hash["mandatory"] || metrics.include?(metric_hash["key"])
          }
        end.flatten + additional_metrics
      end

      def metric_for_week(projects_metric_view,metric,week)
        projects_metric_view["rows"].each do |metric_view|
          if metric_view["key"] == [metric, week.to_time.to_i]
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
    end