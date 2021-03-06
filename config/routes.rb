Books::Application.routes.draw do
 
  match "about/(:id)" => "start#about"
  match "order_query" => "start#query"
  match "query_rst" => "start#query_rst"
  
  match "n/(:id)" => "products#node"
  match "c/(:id)" => "products#category"
  match "p/(:id)" => "products#show"
  match "publisher/(:id)" => "products#publisher"
  match "author/(:id)" => "products#author"
  match "tag/(:id)" => "products#tag"
  match "search" => "products#search"
  
  match "add_to_cart/(:id)" => "products#add_to_cart"
  match "cart" => "products#cart"
  match "update_cart" => "products#update_cart"
  match "remove_item/(:id)" => "products#remove_item"
  
  match "add_to_favor/(:id)" => "orders#add_to_favor"
  match "remove_favor/(:id)" => "orders#remove_favor"
  match "buy" => "orders#buy"
  match "order" => "orders#order"  
  
  match "login" => "users#login"
  match "login_rst" => "users#login_rst"
  match "reg" => "users#reg"
  match "reg_rst" => "users#create"
  match "logout" => "users#logout"
  
  match "center" => "center#index"
  match "u/orders" => "center#orders"
  match "u/favors" => "center#favors"
  
  match "admin" => "account#login"
  get "account/main"
  get "account/desktop"
  match "admin_login_rst" => "account#login_rst"
  match "admin_logout" => "account#logout"

  namespace :admin do
    
    get "attrs/index"
    post "attrs/index"
    resources :attrs
    
    get "doubans/tag"
    post "doubans/tag"
    get "doubans/q"
    post "doubans/q"
    get "doubans/douid"
    post "doubans/douid"
    post "doubans/item"
    match "doubans/item/(:id)" => "doubans#item"
    post "doubans/save_product"
    get "doubans/index"
    post "doubans/index"
    resources :doubans
    
    get "topics/index"
    post "topics/index"
    resources :topics
    
    get "products/index"
    post "products/index"
    resources :products
    
    get "publishers/index"
    post "publishers/index"
    resources :publishers
    
    get "authors/index"
    post "authors/index"
    resources :authors
    
    get "tags/index"
    post "tags/index"
    resources :tags
    
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
  
  match "admin/*path" => "application#render_not_found_admin"
  match "*path" => "application#render_not_found"
  
end