Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :individual_tours
  resources :evening_shows
  resources :avia_tours
  resources :land_tours
  resources :phuket_tours
  resources :sea_tours
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
