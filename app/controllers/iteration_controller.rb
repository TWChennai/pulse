class IterationController < ApplicationController
  def new
    @project = Project.get(params[:project_id])
    @project_template = ProjectTemplate.project_template
    @iteration = Iteration.new
    render :template => false
  end

  def save
    @project = Project.get(params[:project_id])
    iteration = Iteration.new(params[:iteration])
    iteration.file_attachments = params[:attachments] if params[:attachments]
    iteration.notes=params[:notes]
    @project.iterations << iteration
    @project.save!
    redirect_to(@project)
  end

  def edit
    @project = Project.get(params[:project_id])
    @iteration = @project.iterations[params[:index].to_i]
    render :template => false
  end

  def update
    @project = Project.get(params[:project_id])
    iteration = @project.iterations[params[:index].to_i]
    iteration.file_attachments = params[:attachments] if params[:attachments]
    iteration.notes=params[:notes]
    iteration.merge!(params[:iteration])

    @project.save!
    redirect_to(@project)
  end

  def attachment
    @project = Project.get(params[:project_id])
    iteration = @project.iterations[params[:index].to_i]
    attachment = iteration.file_attachments.find{|attachment| attachment["name"] == "#{params[:name]}.#{params[:format]}"}
    loc = Rails.root.join("public", "attachments") + attachment["location"].split('/').last; 
    send_data File.read(loc), :filename => attachment[:name], :type => attachment["mime_type"]
  end

  def remove_attachment
    @project = Project.get(params[:project_id])
    iteration = @project.iterations[params[:index].to_i]
    attachment = iteration.file_attachments.find{|attachment| attachment["name"] == "#{params[:name]}.#{params[:format]}"}
    iteration["attachments"].delete(attachment)
    @project.save!

    request.xhr? ? render(:text => "success") : redirect_to(@project)
  end
end
