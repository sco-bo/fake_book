Rails.application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks", :registrations => "custom_registrations" }


  devise_scope :user do 
    authenticated :user do 
      root 'users#index', as: :authenticated_root
    end

    unauthenticated do 
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end  

  resources :friendships, only: [:create, :update, :destroy, :index]
  resources :posts, except: [:edit, :update] do 
    resources :comments
  end

  match 'like', to: 'likes#like', via: :post 

  match 'unlike', to: 'likes#unlike', via: :delete

  get 'feed', to: 'posts#index'
  
  get 'users', to: 'users#index'

  match 'users/:id', :to => "users#show", constraints: {id: /[^\/]+/}, :as => :user, :via => :get
end
