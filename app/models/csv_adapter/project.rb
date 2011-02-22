require 'csv'

module CSVAdapter
  class Project
    attr_accessor :project

    def initialize(project)
      @project = project
    end
    
    def to_csv
      Project.csv_stream do |csv|
        csv << [@project.name]
        csv << []
        csv << []
        properties(csv)
        csv << []
        csv << []
        iterations(csv)
      end
    end

    def self.csv_stream
      stream = out_stream
      CSV::Writer.generate(stream) do |csv|
        yield(csv)
      end
      stream
    end

    def self.out_stream
      ""
    end

    private
    def properties(csv)
      @project.project_properties.each do |key, value|
        csv << [key, value]
      end
    end

    def iterations(csv)
      @project.iterations.each_with_index do |iteration, index|
        csv << (["Week"] + iteration.metrics.collect(&:name)) if index == 0
        csv << ([iteration.date] + iteration.metrics.collect(&:value))
        csv << (["Comment"] + iteration.metrics.collect(&:comment))
        csv << []
      end
    end

  end
end