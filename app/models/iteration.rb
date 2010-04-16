class Iteration < CouchRest::ExtendedDocument
  ATTACHMENTS_DIR = Rails.root.join("public", "attachments")
  
  property :date
  property :metrics, :cast_as => [Metric]
  
  def mandatory_metrics
    @mandatory_metrics = []
    ProjectTemplate.mandatory_metrics.each do |mandatory|
      metrics.each do |metric|
        @mandatory_metrics << metric if mandatory.name == metric.name
      end
    end
    @mandatory_metrics
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