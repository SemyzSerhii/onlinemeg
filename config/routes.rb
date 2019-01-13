Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'products#index'

  resources :products, only: %i[show index]
  resources :tags, only: [:show]
end
