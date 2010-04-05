class ProjectController < ApplicationController
  def show 
    @project = Project.get(params[:id])
    @properties = stuff_project_properties(@project)
  rescue StandardError => e
    render :template => 'public/404.html'
  end

  def new
    @title = "New Project Page"
    @project_template = ProjectTemplate.project_template
  end

  def edit
    @project_template = ProjectTemplate.project_template
    @project = Project.get(params[:id])
  # rescue
  #   render :template=>'public/404.html'
  end

  def save
    @project = Project.new(params.slice("properties", "metrics").merge(:name => "default"))
    @project.save
    redirect_to(show_project_path(@project.id))
  end

  def update
    @project=Project.find(params[:project][:id])
    @tracked_properties=@project["properties"]
    @id = params[:project][:id]
    @project["properties"] = get_converted_properties(@tracked_properties,params[:properties])
    @project.save
    redirect_to(:action=>'show', :id=>@id)
  rescue
    render :template=>'public/404.html'
  end
  private
  def stuff_project_properties(project)
    ProjectTemplate.project_template.properties_group.map do |property|
      {
        :key => property.key,
        :name => property.name,
        :description => property.description, 
        :value => project.properties[property.key]
      }
    end
  end
end