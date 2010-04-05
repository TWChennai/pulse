require 'metric_data'
class MetricGroup < CouchRest::ExtendedDocument
  property :name
  property :order
  property :data, :cast_as => [MetricData]
end