class Project < CouchRest::ExtendedDocument
  use_database COUCHDB_SERVER

  property :metrics
  property :properties
  property :iterations, :cast_as => [Iteration]
  property :name

  view_by :list,
  :map => 
  "function(doc) {
  if (doc['couchrest-type'] == 'Project') {
    emit(doc._id, doc.name);
  }
  }"

  view_by :location,
  :map => "
  function(doc) {
    if (doc['couchrest-type'] == 'Project') {
      if(doc.properties) { 
        emit(doc.properties.location, doc._id);
      }
    }
  }
  ", 
  :reduce => "
  function(keys, values) {
    return values;
  }
  "

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
            emit(doc.iterations[store].metrics[metric].name,[{'date': doc.iterations[store].date},{'values': [doc.iterations[store].metrics[metric].value,doc.name]} ])
          }
        }
      }
    }
  }
}
"
def initialize(*args)
  self.properties = {}
  self.metrics = {}
  self.iterations = []
  super(*args)
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
  end.flatten
end
end