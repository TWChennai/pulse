class RiskController < ApplicationController
  def new
    @project = Project.get(params[:project_id])
    @project_template = ProjectTemplate.project_template
    @risk = RiskData.new
    render :template => false
  end
  def save
    @project = Project.get(params[:project_id])
    @risk = RiskData.new(params[:risk])
    @project.risks << @risk
    @project.save!
    redirect_to(@project)
  end
end
