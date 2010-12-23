class Risk < CouchRest::ExtendedDocument
  property :histories, :cast_as => [RiskHistory]
  property :date_modified

  def initialize(*args)
    self.histories = []
    self.date_modified = Date.today
    super(*args)
  end

  def days_open
    self["state"] == "Open" ? (Date.today - Date.parse(self["start_date"])).to_i : "--" 
  end
end
