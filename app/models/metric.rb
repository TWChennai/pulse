class Metric < CouchRest::ExtendedDocument
  module Value
    RED = "Red"
    LIGHTGREEN = "Lightgreen"
    ORANGE = "Orange"
    GREEN = "Green"
    AMBER = "Amber"
  end

  VALUES = [Metric::Value::RED, Metric::Value::ORANGE, Metric::Value::AMBER, Metric::Value::LIGHTGREEN, Metric::Value::GREEN]

  property :name
  property :value
  property :comment
end
