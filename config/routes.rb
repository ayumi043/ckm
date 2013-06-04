Ckm::Application.routes.draw do
 

  get 'upload' => 'uploads#index'
  post 'upload' => 'uploads#upload'

  mount UeditorRails::Engine => '/ueditor'

  # resources :
  resources :daili

  get 'about/' => redirect("/about/1")
  get 'about/(:id)' => 'abouts#show'
  # get 'about/(:id)' => 'abouts#show', :constraints => {:id => /[1-4]/}

  resources :partners

  namespace :admin do

    get 'showpartners/(:id)' => 'agents#get_partners'
    get 'regions/(:id)' => 'partners#get_regions'

    resources :jiamengs
    resources :downloads
    resources :teams
    resources :shops
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
    resources :zhaoshangs
    resources :abouts
    resources :agents

  end

  root :to => 'home#index'

end
