Rails.application.routes.draw do
  devise_for :users
  root'welcome#home'
  resources :users, only: [:show]
  resources :itinerary, except: [:new]
  get '/users/:id/itinerary/new', to: 'itinerary#new', as: 'new_itinerary'

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: 'register'
    get 'login', to: 'devise/sessions#new', as: 'login'
  end
end
