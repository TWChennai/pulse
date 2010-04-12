class IterationController < ApplicationController
  def new
    @project = Project.get(params[:project_id])
    @project_template = ProjectTemplate.project_template
    @iteration = Iteration.new
    render :template => false
  end
  
  def save
    @project = Project.get(params[:project_id])
    @project.iterations << Iteration.new(params[:iteration])
    @project.save!
    redirect_to(@project)
  end

  def edit
    @project = Project.get(params[:project_id])
    iteration_index = params[:index].to_i
    @iteration = @project.iterations[iteration_index]
    render :template => false
  end
  
  def update
    @project = Project.get(params[:project_id])
    iteration_index = params[:index].to_i
    @project.iterations[iteration_index] = params[:iteration]
    @project.save!
    redirect_to(@project)
  end
end