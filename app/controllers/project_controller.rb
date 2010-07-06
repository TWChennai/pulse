class ProjectController < ApplicationController
  def show
    @project = Project.get(params[:id])
    @title = @project.name
    @properties = @project.stuff_properties
    @all_metrics=@project.all_metrics
    @filtered_metrics=@all_metrics
    unless params[:metric_filter] == nil
      @filtered_metrics=params[:metric_filter]
      @project.filtered_metrics=@filtered_metrics
      @project.save
    end
    
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
    unless @project.isAlive
      render :template  => 'public/404.html'
    end
  end

  def create
    @project = Project.new(project_hash_from_params)
    @project.save
    redirect_to(@project)
  end

  def update
    @project = Project.get(params[:id])
    unless @project.isAlive
      render :template  => 'public/404.html'
    else
      @project.merge!(project_hash_from_params)
      @project.save
      redirect_to(@project)
    end
  end

  def close
    @project = Project.get(params[:id])
    if @project.isAlive == false
      flash[:error] = "Attempting to close a project which is already closed"
    else
      flash[:notice] = "Project has been successfully closed."
      @project.isAlive = false
      @project.save
    end
    redirect_to(@project)
  end

  def reopen
    @project = Project.get(params[:id])
    if @project.isAlive
      flash[:error] = "Attempting to reopen a project which is already open."
    else
      @project.isAlive = true
      @project.save
      flash[:notice] = "Project has been successfully reopened."
    end
    redirect_to(@project)
  end

  private
  def project_hash_from_params
    project_params = params[:project]
    project_params[:location] = project_params[:location].downcase
    project_params[:metrics] = project_params[:metrics].keys unless project_params[:metrics].nil?
    project_params[:additional_metrics] = project_params[:additional_metrics].map{|k,v| {"name" => k, "key" => k, "description" => v}} if project_params[:additional_metrics]
    project_params
  end

 
end
