Rails.application.routes.draw do
  root to: 'welcome#home'
  get '/register', to: 'users#new', as: 'register'

  resources :users, except: [:new]
end
