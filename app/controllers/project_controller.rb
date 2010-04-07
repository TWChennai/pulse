class ProjectController < ApplicationController
  def show 
    @project = Project.get(params[:id])
    @properties = @project.stuff_properties
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
    @project = Project.new(params[:project])
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
  
  def new_iteration
    @project = Project.get(params[:id])
    @project_template = ProjectTemplate.project_template
  end
end