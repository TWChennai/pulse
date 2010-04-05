ActionController::Routing::Routes.draw do |map|
  map.resources :project

  map.root :controller => :dashboard, :action => :index
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
