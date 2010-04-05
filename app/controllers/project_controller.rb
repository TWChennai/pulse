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
    @project = Project.new
  end

  def edit
    @project_template = ProjectTemplate.project_template
    @project = Project.get(params[:id])
  rescue
    render :template=>'public/404.html'
  end

  def create
    @project = Project.new(params[:project].merge(:name => "default"))
    @project.save
    redirect_to(@project)
  end

  def update
    @project = Project.get(params[:id])
    @project.merge!(params[:project])
    @project.save
    redirect_to(@project)
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