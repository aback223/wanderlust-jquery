Rails.application.routes.draw do
  devise_for :users
  root'welcome#home'

  resources :users, only: [:show]
  resources :itinerary, except: [:new, :show, :index, :update, :destroy, :create]

  get '/users/:id/itineraries/new', to: 'itinerary#new', as: 'new_itinerary'
  get '/users/:id/itineraries', to: 'users#itinerary_index', as: 'itineraries'
  get '/users/:id/itineraries/:itinerary_id', to: 'users#itinerary', as: 'itinerary'
  post '/users/:id/itineraries', to: 'itinerary#create'

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: 'register'
    get 'login', to: 'devise/sessions#new', as: 'login'
  end
end
