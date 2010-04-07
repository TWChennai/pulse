ActionController::Routing::Routes.draw do |map|
  map.resources :project

  map.root :controller => :dashboard, :action => :index
  
  map.new_iteration '/project/:id/new_iteration', :controller  => :project, :action  => :new_iteration
  map.save_iteration '/project/:id/save_iteration', :controller => :project, :action => :save_iteration
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
