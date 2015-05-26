Rails.application.routes.draw do

  root to: 'index#index'

  resources :users, only: :create
  resources :sessions, only: %i(create destroy)

  resources :corners, only: %i(show new create) do
    resources :battles, only: %i(show new create) do
      resources :entries, only: %i(create destroy)
    end
    post 'follow' => 'followings#create', entity_type: 'Corner'
    delete 'unfollow' => 'followings#destroy', entity_type: 'Corner'
  end
  
  resources :likes, only: :create do
    collection { delete '/' => :destroy }
  end

end
