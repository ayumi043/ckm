Ckm::Application.routes.draw do
 

  get 'upload' => 'uploads#index'
  post 'upload' => 'uploads#upload'

  mount UeditorRails::Engine => '/ueditor'


  resources :partners

  namespace :admin do

    get 'showpartners/(:id)' => 'agents#get_partners'
    get 'regions/(:id)' => 'partners#get_regions'

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
    resources :abouts
    resources :agents

  end

  root :to => 'home#index'

end
