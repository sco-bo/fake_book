Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do 
    authenticated :user do 
      root 'users#index', as: :authenticated_root
    end

    unauthenticated do 
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end  

  resources :friendships, only: [:create, :update, :destroy]
  resources :posts, except: [:show, :edit, :update]

  get 'feed', to: 'posts#index'
  
  get 'users', to: 'users#index'

  get 'users/:id', to: 'users#show', as: :user

  
end
