Pulse::Application.routes.draw do

  root :to => "dashboard#index"

  resources :projects
  match '/project/close/:id', :to=>"projects#close", :as=>'close_project'
  match '/project/reopen/:id', :to=>"projects#reopen", :as=>'reopen_project'
  match '/projects/:id/export', :to =>"projects#export_as_csv", :as=>'export_project_as_csv'
  match 'projects/all/closed', :to => "projects#list_closed_projects", :as=>'list_closed_projects'
  match '/project/:project_id/new_iteration', :to  => "iteration#new", :as=>"new_iteration"
  match '/project/filter/:id', :to=> "project#show", :as=>'filter_metrics'

  match '/feedback/index', :to => "feedback#view", :as=>"feedback"
  match '/feedback/give', :to=> "feedback#give", :as=>'give_feedback'
  match '/feedback/submit', :to =>"feedback#submit", :as=>'submit_feedback'


  match '/dashboard/:date/export', :to => "dashboard#export_to_csv", :as=>'export_project_dashboard_as_csv'
  match  '/metrics_view/:metric/:from_date/:to_date', :to => "metrics#export_to_csv", :as=>'export_metrics_view_to_csv'

  match   '/project/:project_id/save_iteration', :controller => :iteration, :action => :save, :as=>'save_iteration'
  match   '/project/:project_id/edit_iteration/:index', :controller => :iteration, :action => :edit, :as=>'edit_iteration'
  match   '/project/:project_id/update_iteration/:index', :controller => :iteration, :action => :update, :as=>'update_iteration'

  match   '/project/:project_id/iteration/:index/:name.:format', :controller => :iteration, :action => :attachment, :as=>'iteration_attachment'
  match   '/project/:project_id/iteration/:index/remove/:name.:format', :controller => :iteration, :action => :remove_attachment, :as=>'remove_iteration_attachment'

  match   '/project/:project_id/new_risk', :controller => :risk, :action => :new, :as=>'new_risk'
  match   '/project/:project_id/save_risk', :controller => :risk, :action => :save, :as=>'save_risk'
  match   '/project/:project_id/edit_risk/:index', :controller => :risk, :action => :edit,:as=>'edit_risk'
  match   '/project/:project_id/update_risk/:index', :controller => :risk, :action => :update, :as=>'update_risk'

  match   '/dashboard/week_ending', :controller => :dashboard, :action => :index, :as=>'dashboard_for_a_date'
  match   '/metric', :controller => :metrics, :action => :index, :as=>'metric_view'
  match   '/project/:project_id/filter_notes_by_date', :controller => :iteration, :action => :filter_notes_by_date, :as=>'filter_notes_by_date'

  match   '/staffing_plan', :controller => :staffing_plan, :action => :index, :as=>'staffing_plan'
  match   '/staffing_plan/create', :controller => :staffing_plan, :action => :create, :as=>'create_staffing_plan'
  match   '/staffing_plan/update', :controller => :staffing_plan, :action => :update, :as=>'update_staffing_plan'

  match   'auth/saml/callback', :controller => :auth, :action => :saml_callback, :as=>'okta_callback'
  match   'logout', :controller => :auth, :action => :logout, :as=>'logout'


  
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end

