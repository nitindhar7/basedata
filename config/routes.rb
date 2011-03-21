ActionController::Routing::Routes.draw do |map|
  
  # Root Route
  map.root :controller => :dashboard, :action => :welcome
  
  # Named Routes
  map.features 'features', :controller => :features, :action => :index
  map.support 'support', :controller => :features, :action => :support
  map.dashboard 'dashboard', :controller => :dashboard, :action => :index
  map.signin 'signin', :controller => :accounts, :action => :signin
  map.signout 'signout', :controller => :accounts, :action => :signout
  
  # Regular Routes
  # Clump data at the end of the url. product_data is never actually references
  map.connect 'product/index/*product_data', :controller => :product, :action => :index

  # Resources
  map.resources :accounts
  map.resources :collections
  
  # Default Routes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action'
end