ActionController::Routing::Routes.draw do |map|
  map.resources :project
  map.close_project '/project/close/:id', :controller => :project, :action => :close
  map.reopen_project '/project/reopen/:id', :controller => :project, :action => :reopen
  map.list_closed_projects 'projects/all/closed', :controller => :projects, :action => :list_closed_projects
  map.feedback '/feedback/index', :controller => :feedback , :action=> :view
  map.give_feedback '/feedback/give', :controller=> :feedback , :action => :give
  map.submit_feedback '/feedback/submit', :controller =>:feedback , :action => :submit
  map.export_project_as_csv '/project/:id/export', :controller => :project, :action => :export_as_csv
  map.export_project_dashboard_as_csv '/dashboard/:date/export', :controller => :dashboard, :action => :export_to_csv
  map.export_metrics_view_to_csv '/metrics_view/:metric/:from_date/:to_date', :controller => :metrics, :action => :export_to_csv
  map.new_iteration '/project/:project_id/new_iteration', :controller  => :iteration, :action  => :new
  map.save_iteration '/project/:project_id/save_iteration', :controller => :iteration, :action => :save
  map.edit_iteration '/project/:project_id/edit_iteration/:index', :controller => :iteration, :action => :edit
  map.update_iteration '/project/:project_id/update_iteration/:index', :controller => :iteration, :action => :update
  map.filter_metrics '/project/filter/:id', :controller=> :project, :action =>:show
  map.iteration_attachment '/project/:project_id/iteration/:index/:name.:format', :controller => :iteration, :action => :attachment
  map.remove_iteration_attachment '/project/:project_id/iteration/:index/remove/:name.:format', :controller => :iteration, :action => :remove_attachment

  map.new_risk '/project/:project_id/new_risk', :controller => :risk, :action => :new
  map.save_risk '/project/:project_id/save_risk', :controller => :risk, :action => :save
  map.edit_risk '/project/:project_id/edit_risk/:index', :controller => :risk, :action => :edit
  map.update_risk '/project/:project_id/update_risk/:index', :controller => :risk, :action => :update

  map.dashboard_for_a_date '/dashboard/week_ending', :controller => :dashboard, :action => :index
  map.metric_view '/metric', :controller => :metrics, :action => :index 
  map.filter_notes_by_date '/project/:project_id/filter_notes_by_date', :controller => :iteration, :action => :filter_notes_by_date

  map.staffing_plan '/staffing_plan', :controller => :staffing_plan, :action => :index
  map.create_staffing_plan '/staffing_plan/create', :controller => :staffing_plan, :action => :create
  map.update_staffing_plan '/staffing_plan/update', :controller => :staffing_plan, :action => :update

  map.root :controller => :dashboard, :action => :index
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

