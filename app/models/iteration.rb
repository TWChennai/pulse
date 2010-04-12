class Iteration < CouchRest::ExtendedDocument
  property :date
  property :metrics, :cast_as => [Metric]
end