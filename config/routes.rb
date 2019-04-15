Rails.application.routes.draw do
  root 'welcome#index'

  # Authentication Paths
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/register', to: 'users#new', as: :registration
  post '/register', to: 'users#create'

  resources :users, only: [:new, :create, :index]
  resources :interests, only: [:index]
  resources :carts, only: [:create]

  namespace :admin do
    resources :interests, only: [:new, :create]
    resources :users, only: [:index, :show]
    patch '/users/:id/upgrade', to: 'users#upgrade', as: :upgrade_user
  end
end
