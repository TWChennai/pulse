module DAL
  class ProjectsGroup
    def initialize(location,projects)
      @location = location
      @projects = projects
    end
    attr_reader :location, :projects
  end  
end
