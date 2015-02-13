Pulse::Application.routes.draw do
  get "models/new"

  get "models/index"

  get "models/show"

  get "models/create"

  resources :projects
  match '/project/close/:id', :to=>"projects#close", :as=>'close_project'
  match '/project/reopen/:id', :to=>"projects#reopen", :as=>'reopen_project'
  match '/projects/:id/export', :to =>"projects#export_as_csv", :as=>'export_project_as_csv'
  # TODO where is this ?
  match 'projects/all/closed', :to => "projects#list_closed_projects", :as=>'list_closed_projects'


  match '/feedback/index', :to => "feedback#view", :as=>"feedback"
  match '/feedback/give', :to=> "feedback#give", :as=>'give_feedback'
  match '/feedback/submit', :to =>"feedback#submit", :as=>'submit_feedback'


  # map.export_project_dashboard_as_csv '/dashboard/:date/export', :controller => :dashboard, :action => :export_to_csv
  # map.export_metrics_view_to_csv '/metrics_view/:metric/:from_date/:to_date', :controller => :metrics, :action => :export_to_csv
  match '/project/:project_id/new_iteration', :to  => "iteration#new", :as=>"new_iteration"
  # map.save_iteration '/project/:project_id/save_iteration', :controller => :iteration, :action => :save
  # map.edit_iteration '/project/:project_id/edit_iteration/:index', :controller => :iteration, :action => :edit
  # map.update_iteration '/project/:project_id/update_iteration/:index', :controller => :iteration, :action => :update
  match '/project/filter/:id', :to=> "project#show", :as=>'filter_metrics'
  # map.iteration_attachment '/project/:project_id/iteration/:index/:name.:format', :controller => :iteration, :action => :attachment
  # map.remove_iteration_attachment '/project/:project_id/iteration/:index/remove/:name.:format', :controller => :iteration, :action => :remove_attachment
  #
  # map.new_risk '/project/:project_id/new_risk', :controller => :risk, :action => :new
  # map.save_risk '/project/:project_id/save_risk', :controller => :risk, :action => :save
  # map.edit_risk '/project/:project_id/edit_risk/:index', :controller => :risk, :action => :edit
  # map.update_risk '/project/:project_id/update_risk/:index', :controller => :risk, :action => :update
  #
  # map.dashboard_for_a_date '/dashboard/week_ending', :controller => :dashboard, :action => :index
  # map.metric_view '/metric', :controller => :metrics, :action => :index
  # map.filter_notes_by_date '/project/:project_id/filter_notes_by_date', :controller => :iteration, :action => :filter_notes_by_date
  #
  # map.staffing_plan '/staffing_plan', :controller => :staffing_plan, :action => :index
  # map.create_staffing_plan '/staffing_plan/create', :controller => :staffing_plan, :action => :create
  # map.update_staffing_plan '/staffing_plan/update', :controller => :staffing_plan, :action => :update
  #
  # map.okta_callback 'auth/saml/callback', :controller => :auth, :action => :saml_callback
  # map.logout 'logout', :controller => :auth, :action => :logout
  root :to => "dashboard#index"
  
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end

