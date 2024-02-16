Rails.application.routes.draw do
  root "welcome#index"
  resources :doc
  get 'signup', to:"user#new"
  post 'users', to:'user#create'
  get 'users',to:'welcome#index'
  resources :user, exclude:[:show,:create]
  get 'login', to:"sessions#new"
  post 'login', to:"sessions#create"
  get 'logout', to:'sessions#destroy'
end
