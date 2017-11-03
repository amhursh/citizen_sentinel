Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new', as: 'new_login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
