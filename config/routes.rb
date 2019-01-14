Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'products#index'

  resources :products, only: %i[show index] do
    get :autocomplete_product_title, on: :collection
  end
  resources :tags, only: [:show]
end
