Rails.application.routes.draw do
  post 'sources/request' => 'sources#request'
  resources :remotefiles
  resources :users
  resources :instructions
  resources :recipes
  resources :blogs
  resources :profiles
  resources :tags
  resources :ingredients
  resources :states
  resources :histories
  resources :todos
  resources :libraries
  resources :sessions
  root "hello#index"
end
