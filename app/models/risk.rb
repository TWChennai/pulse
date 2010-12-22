class Risk < CouchRest::ExtendedDocument
  property :name
  property :value
  property :histories, :cast_as => [RiskHistory]

  def initialize(*args)
    self.histories = []
    super(*args)
  end
end
