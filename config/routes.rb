Rails.application.routes.draw do
  root'welcome#home'
  get '/register', to: 'users#new', as: 'register'

  resources :users, except: [:new]
end
