Ckm::Application.routes.draw do
 

  get 'upload' => 'uploads#index'
  post 'upload' => 'uploads#upload'

  mount UeditorRails::Engine => '/ueditor'

  # Sample resource route within a namespace:
  namespace :admin do

    get 'regions/(:id)' => 'partners#get_regions'

    resources :partners

    resources :users

    resources :sessions
    get 'sessions/logout' => 'sessions#destroy'

    get "" => 'home#index'
    # resources :admin

    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    resources :products
    resources :categories

    resources :indexsets

    resources :articles
    resources :abouts
    resources :agents

  end

  root :to => 'home#index'

end
