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
    @project = Project.new(project_hash_from_params)
    @project.save
    redirect_to(@project)
  end

  def update
    @project = Project.get(params[:id])
    @project.merge!(project_hash_from_params)
    @project.save
    redirect_to(@project)
  rescue
    render :template=>'public/404.html'
  end
  
  def new_iteration
    @project = Project.get(params[:id])
    @project_template = ProjectTemplate.project_template
    render :template => false
  end
  
  def save_iteration
    @project = Project.get(params[:id])
    @project.iterations << Iteration.new(params[:iteration])
    @project.save!
    redirect_to(@project)
  end
  
  private
  def project_hash_from_params
    project_params = params[:project]
    project_params[:metrics] = project_params[:metrics].keys
    project_params
  end
end