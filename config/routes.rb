Rails.application.routes.draw do

  get 'likes/create'

  get 'likes/destroy'

  root to: 'index#index'

  resources :users, only: :create
  resources :sessions, only: %i(create destroy)

  resources :corners, only: %i(show new create) do
    resources :battles, only: %i(show new create) do
      resources :entries, only: %i(create destroy)
    end
  end
  
  resources :likes, only: :create do
    collection { delete '/' => :destroy }
  end

end
