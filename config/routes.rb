ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'machines', :action => 'index'
  
  map.resources :qcsessions, :has_many => [ :measurements ]  

  map.resources :machines

  map.resources :categories, :has_many => [:measurement_types]

  map.resources :users
  
#  map.resource :session, :controller => 'sessions'
  
  map.resource :session
  
  map.signup 'signup', :controller => 'users', :action => "new"
  
  map.with_options :controller => 'session' do |session|
    session.login    'login',  :action => 'new'
    session.logout   'logout', :action => 'destroy'
  end
  
  map.resources :reports, :collection => {:measurement => :get}

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.

  map.connect ":controller/:action/:id"
  
end
