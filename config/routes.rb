Rails.application.routes.draw do
  root to: 'welcome#index'


  resources :issues, only: [:index]
  
  namespace :users do
    resources :issues, only: [:index]
  end
  
  resources :users, only: [:new, :create, :show]

  post '/follow_issue', to: 'issue_follows#create', as: 'issue_follows'
  delete '/unfollow_issue', to: 'issue_follows#destroy', as: 'issue_unfollows'

  get '/login', to: 'sessions#new', as: 'new_login'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/auth/:provider', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
end
