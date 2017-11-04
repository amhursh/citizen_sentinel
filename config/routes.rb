Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new', as: 'new_login'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/auth/:provider', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
end
