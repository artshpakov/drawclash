Rails.application.routes.draw do

  root to: 'index#index'

  resources :users, only: :create
  resources :sessions, only: %i(create destroy)

end
