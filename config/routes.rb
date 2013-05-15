Ckm::Application.routes.draw do
 

  get 'upload' => 'uploads#index'
  post 'upload' => 'uploads#upload'



  mount UeditorRails::Engine => '/ueditor'

  # Sample resource route within a namespace:
  namespace :admin do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    resources :products

    resources :indexsets

    resources :articles
    resources :abouts
  end

  # root :to => 'welcome#index'

end
