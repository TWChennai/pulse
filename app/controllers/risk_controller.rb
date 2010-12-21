class RiskController < ApplicationController
  def new
    @project = Project.get(params[:project_id])
    @project_template = ProjectTemplate.project_template
    @risk = Risk.new
    render :template => false
  end
  def edit
    @project = Project.get(params[:project_id])
    @risk = @project.risks[params[:index].to_i]
    render :template => false
  end
  def save
    @project = Project.get(params[:project_id])
    risk = Risk.new(params[:risk])
    @project.risks << risk
    @project.save!
    redirect_to(@project)
  end
  def update
    @project = Project.get(params[:project_id])
    risk = @project.risks[params[:index].to_i]
    risk = risk.merge!(params[:risk])
    @project.save!
    redirect_to(@project)
  end
end
