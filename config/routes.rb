Rails.application.routes.draw do

  root to: 'index#index'

  namespace :auth do
    get ':provider/callback' => :signon
    delete :signout
  end

  resources :corners, only: %i(show new create) do
    resources :battles, only: %i(show new create) do
      resources :entries, only: %i(create destroy) do
        scope(controller: :likes) { post :like, :dislike }
      end
    end

    resources :posts, only: :create

    post 'follow'     => 'followings#create', entity_type: 'Corner'
    delete 'unfollow' => 'followings#destroy', entity_type: 'Corner'
  end
  
  resources :likes, only: :create do
    collection { delete '/' => :destroy }
  end

end
