Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users, only: [:new, :create, :show]

  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
