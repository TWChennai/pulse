class ProjectController < ApplicationController
  def show
    @project = Project.get(params[:id])
    @title = @project.name
    @properties = @project.stuff_properties
  end
  
  def export_as_csv
    @project = Project.get(params[:id])
    send_data CSVAdapter::Project.new(@project).to_csv, :filename => "#{@project.name}.csv"
  end

  def new
    @title = "New Project Page"
    @project_template = ProjectTemplate.project_template
    @project = Project.new
  end

  def edit
    @project_template = ProjectTemplate.project_template
    @project = Project.get(params[:id])
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
  end
  
  private
  def project_hash_from_params
    project_params = params[:project]
    project_params[:metrics] = project_params[:metrics].keys unless project_params[:metrics].nil?
    project_params
  end
end