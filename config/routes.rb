Rails.application.routes.draw do
  root 'purchases#index'

  resources :purchases
  resources :categories
end
