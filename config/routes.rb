Books::Application.routes.draw do
 
  match "about/(:id)" => "start#about"
  
  match "n/(:id)" => "products#node"
  match "c/(:id)" => "products#category"
  match "p/(:id)" => "products#show"
  match "publish/(:id)" => "products#publish"
  match "author/(:id)" => "products#author"
  
  match "login" => "users#login"
  match "login_rst" => "users#login_rst"
  match "reg" => "users#reg"
  match "reg_rst" => "users#reg_rst"
  match "logout" => "users#logout"
  
  match "admin" => "account#login"
  get "account/main"
  get "account/desktop"
  match "admin_login_rst" => "account#login_rst"
  match "admin_logout" => "account#logout"

  namespace :admin do
    get "doubans/tag"
    post "doubans/tag"
    get "doubans/q"
    post "doubans/q"
    get "doubans/douid"
    post "doubans/douid"
    get "doubans/index"
    post "doubans/index"
    resources :doubans
    
    get "topics/index"
    post "topics/index"
    resources :topics
    
    get "products/index"
    post "products/index"
    resources :products
    
    get "publishes/index"
    post "publishes/index"
    resources :publishes
    
    get "authors/index"
    post "authors/index"
    resources :authors
    
    get "news_categories/index"
    post "news_categories/index"
    resources :news_categories
    
    get "news_topics/index"
    post "news_topics/index"
    resources :news_topics
    
    get "flashpics/index"
    post "flashpics/index"
    resources :flashpics
    
    get "product_props/index"
    post "product_props/index"
    resources :product_props
    
    get "nodes/index"
    post "nodes/index"
    resources :nodes
    
    get "categories/index"
    post "categories/index"
    resources :categories
    
    get "run_logs/index"
    post "run_logs/index"
    resources :run_logs
    
    get "users/index"
    post "users/index"
    resources :users
    
    get "admins/index"
    post "admins/index"
    resources :admins
  end
  
  get 'kindeditor/images_list'
  post 'kindeditor/upload'

  root :to => "start#index"
  
  match "*path" => "application#render_not_found"
  
end
