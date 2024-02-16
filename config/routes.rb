Rails.application.routes.draw do
  root "welcome#index"
  post 'doc/new', to:"doc#create"
  get  'filter_file' => 'doc#filter_file'
  resources :doc, except: [:create ]
  get 'signup', to:"user#new"
  post 'users', to:'user#create'
  get 'users',to:'welcome#index'
  resources :user, except: [:new,:create]
  get 'login', to:"sessions#new"
  post 'login', to:"sessions#create"
  get 'logout', to:'sessions#destroy'
end
