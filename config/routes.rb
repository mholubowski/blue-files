BlueFiles::Application.routes.draw do


  match '/admin', to: 'admin#index'

  get "subscriptions/new"

  get "subscriptions/create"


  get "document_comments/new"

  get "document_comments/create"

  get "document_comments/destroy"

  get "requests/index"

  get "requests/show"

  get "requests/new"

  get "requests/create"

  get "requests/edit"

  get "requests/destroy"

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"


  get "documents/index"

  get "documents/show"

  get "documents/new"

  get "documents/create"

  get "documents/views"
  get "documents/comments"

  get "accounts/create"

  get "accounts/new"


  get "welcome/index"
  get "welcome/security"
  get "welcome/simplicity"
  get "welcome/pricing"
  get "welcome/technology"

  match '/security', to: 'welcome#security'
  match '/simplicity', to: 'welcome#simplicity'
  match '/pricing', to: 'welcome#pricing'
  match '/technology', to: 'welcome#technology'

  resources :accounts
  resources :documents
  resources :document_comments
  resources :password_resets
  resources :requests
  resources :subscriptions
  resources :sessions, only: [:new, :create, :destroy]

  root :to => 'welcome#index'

  match '/couments/comments', to: 'documents#comments'
  match '/documents/views',  to: 'documents#views'
  match '/signup',  to: 'accounts#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
