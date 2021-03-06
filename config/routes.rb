Rails.application.routes.draw do
  resources :shops
  resources :boats
  resources :carts, only: :index
  resources :orders, only: :create
  resources :cart_items, only: [:create, :destroy, :update]
  resources :individual_tours
  resources :evening_shows
  resources :avia_tours
  resources :land_tours
  resources :phuket_tours
  resources :sea_tours
  resources :static_pages, only: [:new, :edit, :create, :update]
  resources :call_orders, only: :create
  resources :prices, only: :index
  post 'order_all', to: 'orders#cart_order'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/admin',   to: 'sessions#new'
  post   '/admin',   to: 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/individual', to: 'static_pages#individual'
  get '/license', to: 'static_pages#license'
  get '/realty-rent', to: 'static_pages#realty_rent'
  get '/realty-buy', to: 'static_pages#realty_buy'
  get '/transfers', to: 'static_pages#transfer'
  get '/photoshoot', to: 'static_pages#photoshoot'
  get '/wedding', to: 'static_pages#wedding'
  get '/spa', to: 'static_pages#spa'
  get '/db_check', to: 'static_pages#db_check'
  get '/success', to: 'static_pages#success_page'
  get '/sitemap.xml.gz', to: redirect("https://s3-ap-southeast-1.amazonaws.com/coco-travel/sitemaps/sitemap.xml.gz", status: 301), as: :sitemap
  # post '/commet', to: 'comments#create'
  resources :comments, only: [:create, :destroy]
  post 'clean_15_days', to: 'static_pages#clean_15_days'
  post 'clean_30_days', to: 'static_pages#clean_30_days'
end
