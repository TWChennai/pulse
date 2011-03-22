class MetricData < CouchRest::ExtendedDocument
  property :name
  property :tracked
  property :order
  property :mandatory
  property :dm_report
  property :description
  property :key

  def method_missing(sym, *args, &block)
    return nil if (sym == :comment || sym == :value)
    super(sym, *args, &block)
  end
end

