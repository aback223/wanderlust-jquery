Rails.application.routes.draw do
  devise_for :users
  root'welcome#home'
  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: 'register'
  end
end
