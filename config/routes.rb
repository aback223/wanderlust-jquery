Rails.application.routes.draw do
  devise_for :users
  root'welcome#home'
  resources :users, only: [:show]
  resources :itinerary
  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: 'register'
    get 'login', to: 'devise/sessions#new', as: 'login'
  end
end
