module DAL
  class ProjectsGroupByRegion
    def initialize(region, projects)
      @region = region
      @projects = projects
    end

    attr_reader :region, :projects
  end
end