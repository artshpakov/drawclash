Rails.application.routes.draw do

  root to: 'index#index'

  resources :users, only: :create
  resources :sessions, only: %i(create destroy)

  resources :corners, only: %i(show new create update)

end
