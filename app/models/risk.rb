class Risk < CouchRest::ExtendedDocument
  property :histories, :cast_as => [RiskHistory]
  property :date_modified

  def initialize(*args)
    self.histories = []
    self.date_modified = DateTime.now.strftime("%d-%b-%Y")
    super(*args)
  end

  def days_open
    self["state"] == "Open" ? (Date.today -  DateTime.strptime(self["start_date"], "%m/%d/%Y")).to_i : "--"
  rescue
    "(Invalid date)"
  end

  def add_history(risk_history)
    risk_history.merge!({'date_modified' => DateTime.now.strftime("%d-%b-%Y")})
    self.histories << risk_history
  end
end
