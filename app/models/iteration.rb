class Iteration < CouchRest::ExtendedDocument
  property :date
  property :metrics, :cast_as => [Metric]

  def mandatory_metrics
    @mandatory_metrics = []
    ProjectTemplate.mandatory_metrics.each do |mandatory|
      metrics.each do |metric|
        @mandatory_metrics << metric if mandatory.name == metric.name
      end
    end
    return @mandatory_metrics
  end
end