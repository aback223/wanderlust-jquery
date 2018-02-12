Rails.application.routes.draw do
  devise_for :users
  root'welcome#home'
  get '/register', to: 'users#new', as: 'register'
  resources :users, except: [:new]

end
