class MetricData < CouchRest::ExtendedDocument
  property :name
  property :tracked
  property :order
  property :mandatory
  property :description
  property :key
end

