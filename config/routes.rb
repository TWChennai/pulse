ActionController::Routing::Routes.draw do |map|
  map.resources :project

  map.root :controller => :dashboard, :action => :index
  
  map.new_iteration '/project/:id/new_iteration', :controller  => :project, :action  => :new_iteration
  map.save_iteration '/project/:id/save_iteration', :controller => :project, :action => :save_iteration
  map.edit_iteration '/project/:id/edit_iteration/:index', :controller => :project, :action => :edit_iteration
  map.update_iteration '/project/:id/update_iteration/:index', :controller => :project, :action => :update_iteration
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
