Rails.application.routes.draw do
  get 'users/index'

  root 'users#index'
  get '/' => 'users#index'
  get '/users/' => 'users#index', as: 'user'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'show'
  patch '/users/update/:id' => 'users#update', as: 'update'

  # get '/edit/:id' => 'users#edit', as: 'edit'
  delete '/destroy/:id' => 'users#destroy', as: 'destroy'
  
  post '/sessions/new' => 'sessions#create'
  get '/main' => 'sessions#new', as: 'new'
  # post '/sessions/out' => 'sessions#destroy'
  get '/sessions/out' => 'sessions#destroy'

  get '/bright_ideas' => 'posts#index'
  post '/posts/create' => 'posts#create', as: 'create'
  delete '/posts/:id' => 'posts#destroy'

  post '/likes' => 'likes#create'
  post '/unlikes' => 'likes#destroy'
  get '/bright_ideas/:id' => 'likes#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
