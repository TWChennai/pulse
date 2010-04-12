ActionController::Routing::Routes.draw do |map|
  map.resources :project

  map.root :controller => :dashboard, :action => :index
  
  map.new_iteration '/project/:project_id/new_iteration', :controller  => :iteration, :action  => :new
  map.save_iteration '/project/:project_id/save_iteration', :controller => :iteration, :action => :save
  map.edit_iteration '/project/:project_id/edit_iteration/:index', :controller => :iteration, :action => :edit
  map.update_iteration '/project/:project_id/update_iteration/:index', :controller => :iteration, :action => :update
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
