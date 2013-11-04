GikTuts::Application.routes.draw do
  get "signup", to: "gik_users#new"
  match "signin", to: "gik_users#signin", via: [:post, :get]
  match "signout", to: "gik_users#signout", via: [:post, :get]
  get "gik_users/create"
  match "edit", to: "gik_users#edit", via: [:get, :patch]
  get "profile", to: "gik_users#profile"
  resources :gik_users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  match'contact', to: 'home#contact', via: [:get, :post]
  match'service', to: 'home#profile', via: [:get, :post]
  get 'library', to: 'home#profile'
  match 'google', to: 'home#google', via: [:get, :post]
  match 'map', to: 'google_maps#index', via: [:get, :post]

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
