Rails.application.routes.draw do
  devise_for :users
  root'welcome#home'

  resources :users, only: [:show] do
    resources :itineraries
  end

  resources :memberships, only: [:create, :show, :index]
  resources :invites

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: 'register'
    get 'login', to: 'devise/sessions#new', as: 'login'
  end
end
