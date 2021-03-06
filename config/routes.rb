Ckm::Application.routes.draw do
 

  get 'upload' => 'uploads#index'
  post 'upload' => 'uploads#upload'

  get "/bbs/" => redirect("/bbs/forum.php")
  # get '/bbs/:name', to: redirect('/bbs/%{name}')

  #get '/bbs/(:name)', to: redirect('http://www.chekuaimei.com/bbs/%{name}'), constraints: lambda { |request| ['www.ckm888.com', 'ckm888.com', '121.199.5.92'].include?(request.host) }

  mount UeditorRails::Engine => '/ueditor'

  get "service/category/:id/(page/:page)" => "service#category", :as => :category
  resources :service
  resources :downloads
  get "contact" => "contact#index"
  resources :shenqing
  resources :news do
    get 'page/:page', :action => :index, :on => :collection
  end
  resources :jiameng
  resources :zs

  get 'about/' => redirect("/about/1")
  get 'about/(:id)' => 'abouts#show'
  # get 'about/(:id)' => 'abouts#show', :constraints => {:id => /[1-4]/}

  resources :partners do
    get 'code/(:code)' =>  "partners#code", :on => :collection
  end

  namespace :admin do
    get 'showpartners/(:id)' => 'agents#get_partners'
    get 'regions/(:id)' => 'partners#get_regions'


    resources :qqs
    resources :friendlinks
    resources :shenqings
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