class Risk << CouchRest::ExtendedDocument
  property :name
  property :order
  property :key

  module Type
    TECHNICAL = "Technical"
    FUNCTIONAL = "Functional"
    PROCESS = "Process"
  end
  module Impact
    HIGH = "High"
    VERY_HIGH = "Very High"
    MEDIUM = "Medium"
  end
  module State
    OPEN = "Open"
    CLOSED = "Closed"
  end
  TYPES = [Risk::Type::TECHNICAL, Risk::Type::FUNCTIONAL, Risk::Type::PROCESS]
  IMPACT_TYPES = [Risk::Impact::HIGH, Risk::Impact::VERY_HIGH, Risk::Impact::MEDIUM]
  STATES = [Risk::State::OPEN, Risk::State::CLOSED]
end
