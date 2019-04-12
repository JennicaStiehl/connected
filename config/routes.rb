Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:new, :create]
  resources :interests, only: [:index]
  resources :carts, only: [:create]

  namespace :admin do
    resources :interests, only: [:new, :create]
  end
end
