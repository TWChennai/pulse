class StaffingPlanController < ApplicationController

  def index
    @projects = Project.open_projects
    @project = params[:project].nil? ? @projects.first : Project.open_projects.find {|proj| proj.name == params[:project]}
    @iteration_duration = /\d+/.match(@project.project_properties["iteration_duration"])[0].to_i
  end

  def create
    project = Project.get(params[:project_id])
    project.staffing_plans = []
    @iteration_duration = /\d+/.match(project.project_properties["iteration_duration"])[0].to_i
    (1..(project.project_properties["project_duration"].to_i / @iteration_duration)).each do |week|
      week_start_date = Date.parse(project.project_properties["project_start_date"]) + (week*@iteration_duration - @iteration_duration).weeks
      week_end_date = Date.parse(project.project_properties["project_start_date"]) + (week*@iteration_duration).weeks - 1.day
      project.staffing_plans << StaffingPlan.create({:week_start_date => week_start_date, :week_end_date => week_end_date,
                                                     :no_of_pm_onsite => params[:no_of_pm_onsite],
                                                     :no_of_ba_onsite => params[:no_of_ba_onsite],
                                                     :no_of_dev_onsite => params[:no_of_dev_onsite],
                                                     :no_of_qa_onsite => params[:no_of_qa_onsite],
                                                     :no_of_ux_onsite => params[:no_of_ux_onsite],
                                                     :no_of_ui_onsite => params[:no_of_ui_onsite],
                                                     :no_of_cp_onsite => params[:no_of_cp_onsite],
                                                     :no_of_pm_offshore => params[:no_of_pm_offshore],
                                                     :no_of_ba_offshore => params[:no_of_ba_offshore],
                                                     :no_of_dev_offshore => params[:no_of_dev_offshore],
                                                     :no_of_qa_offshore => params[:no_of_qa_offshore],
                                                     :no_of_ux_offshore => params[:no_of_ux_offshore],
                                                     :no_of_ui_offshore => params[:no_of_ui_offshore],
                                                     :no_of_cp_offshore => params[:no_of_cp_offshore],
                                                     :onsite_rate => params[:onsite_rate],
                                                     :offshore_rate => params[:offshore_rate],
                                                     :onsite_velocity => params[:onsite_velocity],
                                                     :offshore_velocity => params[:offshore_velocity]
      })
    end
    project.save
    @projects = Project.open_projects
    @project = project
    render :template => "staffing_plan/index.html.erb"
  end

  def update
    project = Project.get(params[:id].split("|")[0])
    attr = params[:id].split("|")[1]
    week_start_date = params[:id].split("|")[2]
    staffing_plan = project.staffing_plans.find {|plan| plan.week_start_date == week_start_date}
    staffing_plan.send(attr+"=", params[:value])
    staffing_plan.save
    project.save
    @iteration_duration = /\d+/.match(project.project_properties["iteration_duration"])[0].to_i
    @projects = Project.open_projects
    @project = project
    render :text => params[:value]
  end

end
