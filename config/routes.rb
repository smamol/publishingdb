ActionController::Routing::Routes.draw do |map|
  map.resources :sessions

  map.resources :publications, :collection => { :search => :get }

  map.resources :occupations

  map.resources :specialties

  map.resources :awards
  
  map.resources :people, :collection => { :search => :get, 
                                          :filter_people_by_occupation => :get
                                        }

  map.login  '/login',  :controller => 'sessions', :action => 'new'

  map.logout '/logout', :controller => 'sessions', :action => 'destroy', :method => :delete

  map.resources :sessions
 
  
  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "people"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
