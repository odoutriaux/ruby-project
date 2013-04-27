Project::Application.routes.draw do
  resources :orders

  get "admin/index"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  resources :users

  resources :line_items

  resources :carts

  get "store/index"
  get "home/index"
  get 'admin' => 'admin#index'
  get 'store' => 'store#index'

  resources :categories

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :products do
    get :who_bought, :on => :member
  end

  # You can have the root of your site routed with "root"
    root to: 'home#index', :as => 'home'
 
end
