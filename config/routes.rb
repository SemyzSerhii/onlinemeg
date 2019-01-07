Rails.application.routes.draw do
  root 'purchases#index'

  resources :purchases
  resources :categories
  resources :tags, only: [:show]
end
