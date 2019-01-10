Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'purchases#index'

  resources :purchases, only: %i[show index]
  resources :tags, only: [:show]
end
