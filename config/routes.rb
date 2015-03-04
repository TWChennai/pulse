Pulse::Application.routes.draw do
  resources :project
  match '/project/close/:id' => 'project#close', :as => :close_project
  match '/project/reopen/:id' => 'project#reopen', :as => :reopen_project
  match 'projects/all/closed' => 'projects#list_closed_projects', :as => :list_closed_projects
  match '/feedback/index' => 'feedback#view', :as => :feedback
  match '/feedback/give' => 'feedback#give', :as => :give_feedback
  match '/feedback/submit' => 'feedback#submit', :as => :submit_feedback
  match '/project/:id/export' => 'project#export_as_csv', :as => :export_project_as_csv
  match '/dashboard/:date/export' => 'dashboard#export_to_csv', :as => :export_project_dashboard_as_csv
  match '/metrics_view/:metric/:from_date/:to_date' => 'metrics#export_to_csv', :as => :export_metrics_view_to_csv
  match '/project/:project_id/new_iteration' => 'iteration#new', :as => :new_iteration
  match '/project/:project_id/save_iteration' => 'iteration#save', :as => :save_iteration
  match '/project/:project_id/edit_iteration/:index' => 'iteration#edit', :as => :edit_iteration
  match '/project/:project_id/update_iteration/:index' => 'iteration#update', :as => :update_iteration
  match '/project/filter/:id' => 'project#show', :as => :filter_metrics
  match '/project/:project_id/iteration/:index/:name.:format' => 'iteration#attachment', :as => :iteration_attachment
  match '/project/:project_id/iteration/:index/remove/:name.:format' => 'iteration#remove_attachment', :as => :remove_iteration_attachment
  match '/project/:project_id/new_risk' => 'risk#new', :as => :new_risk
  match '/project/:project_id/save_risk' => 'risk#save', :as => :save_risk
  match '/project/:project_id/edit_risk/:index' => 'risk#edit', :as => :edit_risk
  match '/project/:project_id/update_risk/:index' => 'risk#update', :as => :update_risk
  match '/dashboard/week_ending' => 'dashboard#index', :as => :dashboard_for_a_date
  match '/metric' => 'metrics#index', :as => :metric_view
  match '/project/:project_id/filter_notes_by_date' => 'iteration#filter_notes_by_date', :as => :filter_notes_by_date
  match '/staffing_plan' => 'staffing_plan#index', :as => :staffing_plan
  match '/staffing_plan/create' => 'staffing_plan#create', :as => :create_staffing_plan
  match '/staffing_plan/update' => 'staffing_plan#update', :as => :update_staffing_plan
  match 'auth/saml/callback' => 'auth#saml_callback', :as => :okta_callback
  match 'logout' => 'auth#logout', :as => :logout
  match '/project/create/:id' => 'project#create', :as => :create_project
  match '/project/update/:id' => 'project#update', :as => :update_project
  match '/project/:id' => 'project#show', :as => :project
  match '/' => 'dashboard#index'
  match '/:controller(/:action(/:id))'
end