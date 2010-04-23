class Iteration < CouchRest::ExtendedDocument
  ATTACHMENTS_DIR = Rails.root.join("public", "attachments")

  property :date
  property :metrics, :cast_as => [Metric]

  def mandatory_metrics
    @mandatory_metrics = []
    ProjectTemplate.mandatory_metrics.each do |mandatory_metric|
      metric= has_metric(mandatory_metric)
      unless metric.nil?
        @mandatory_metrics << metric
      else 
        @mandatory_metrics << Metric.new(:name => mandatory_metric.name, :value => "undefined",:comment => "undefined")
      end
    end
    return @mandatory_metrics
  end

  def has_metric(mandatory_metric)
    metrics.each do |metric|   
      return metric if metric.name == mandatory_metric.name 
    end
    return nil
  end

  def file_attachments=(attachment_files)
    self[:attachments] ||= []
    self[:attachments] +=
    attachment_files.collect do |file|
      name = file.original_filename
      mime_type = ::MIME::Types.type_for(name).first.nil_or.content_type
      name_parts = name.split(".")
      sanitised_file_name = name_parts.size == 1 ? name.gsub(/[^a-zA-Z0-9\._]/, "-") : name_parts[0..-2].join("-").gsub(/[^a-zA-Z0-9\._]/, "-") + "." + name_parts.last
      {
        :name => sanitised_file_name,
        :location => attachment_file_name(name, file.read),
        :mime_type => mime_type
      }
    end
  end

  def file_attachments
    self[:attachments] || []
  end

  private
  def attachment_file_name(name, contents)
    file = File.open("#{ATTACHMENTS_DIR}/#{name}-#{Time.now.to_i}", "w+") do |f|
      f << contents
    end
    file.path
  end

end