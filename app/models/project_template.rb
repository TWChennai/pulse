class ProjectTemplate < CouchRest::ExtendedDocument
  use_database COUCHDB_SERVER
  TEMPLATE_JSON_FILE = Rails.root.join("db", "couch", "project_template.json")
  DESIGN_DOC = "_design/template"

  property :metrics_group, :cast_as => [MetricGroup]
  property :properties_group, :cast_as => [ProjectProperty]
  property :risk_types, :cast_as => [Metric]
  property :name

  def self.create
    document =  COUCHDB_SERVER.get(DESIGN_DOC)
    COUCHDB_SERVER.delete_doc(document) if (document)
  ensure
    COUCHDB_SERVER.save_doc({
            "_id" => DESIGN_DOC,
            "properties_group" => properties_group_from_json,
            "metrics_group" => metrics_group_from_json,
            "couchrest-type" => name
    })
  end

  def self.mandatory_metrics
    filter_metrics_by("mandatory", true)
  end

  def self.project_template
    get DESIGN_DOC
  end

  def self.metrics_group_from_json
    hash_from_json["metrics_group"]
  end

  def self.properties_group_from_json
    hash_from_json["properties_group"]
  end

  def self.risk_types_from_json
    hash_from_json["risk_types"]
  end

  def self.user_input_risk_types_from_json
    user_input_risk_types = []
    risk_types_from_json().each { |risk_type|
      user_input_risk_types << risk_type if (risk_type['user-input'])
    }
    user_input_risk_types
  end

  def self.tracked_risks_from_json
    tracked_risk_types = []
    risk_types_from_json().each { |risk_type|
      tracked_risk_types << risk_type if (risk_type['track-history'])
    }
    tracked_risk_types
  end

  def self.hash_from_json
    @@hash ||= JSON.parse(File.read(TEMPLATE_JSON_FILE))
  end

  private_class_method :hash_from_json

  private

  def self.filter_metrics_by(attribute, value)
    ProjectTemplate.project_template.metrics_group.map do |metrics_group_from_template|
      metrics_group = metrics_group_from_template.clone
      metrics_group.data.select { |metric_hash|
        metric_hash[attribute] == value
      }
    end.flatten
  end

  def self.migrate_data
    COUCHDB_SERVER.documents(:include_docs => true)["rows"].each do |doc|
      if doc['doc']['couchrest-type'] == 'Project'
        doc['doc']["project_properties"] = doc['doc']["properties"]
        doc['doc'].delete("properties")
        COUCHDB_SERVER.save_doc(doc['doc'])
      end
    end

    Project.view("by_location").each do |project|
      project.iterations.each do |iteration|
        if (!iteration.metrics.find { |metric| metric.name == "Engagement Status" })
          iteration.metrics << Metric.new(:name => "Engagement Status", :value => "Green", :comment => "undefined")
        end
      end
      ["engagement_model", "development_languages_used", "client", "pm", "dm", "cp", "dp", "sales_region", "delivery_status", "client_category"].each do |property|
        project.project_properties[property] = project.project_properties[property].blank? ? "to be filled" : project.project_properties[property]
      end
      if (project.filtered_metrics)
        project.filtered_metrics.delete("Customer Satisfaction")
        project.filtered_metrics.delete("Team Satisfaction")
        project.filtered_metrics.delete("Engagement Status")
        project.filtered_metrics << "Engagement Status"
      end
      project.region = "NA"
      project.save!      
    end
  end

end
