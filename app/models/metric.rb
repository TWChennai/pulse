class Metric < CouchRest::ExtendedDocument
  module Value
    RED = "Red"
    GREEN = "Green"
    AMBER = "Amber"
  end
  VALUES = [Metric::Value::RED, Metric::Value::GREEN, Metric::Value::AMBER]
  
  property :name
  property :value
  property :comment
end