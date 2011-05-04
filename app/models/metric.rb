class Metric < CouchRest::ExtendedDocument
  module Value
    RED = "Red"
    LIGHTGREEN = "Lightgreen"
    ORANGE = "Orange"
    GREEN = "Green"
    AMBER = "Amber"
  end
  VALUES = [Metric::Value::RED, Metric::Value::LIGHTGREEN, Metric::Value::ORANGE, Metric::Value::GREEN, Metric::Value::AMBER]
  
  property :name
  property :value
  property :comment
end