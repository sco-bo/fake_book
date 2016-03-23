Rails.application.routes.draw do
  resources :friendships, only: [:create, :update, :destroy]

  get 'users/index'

  get 'users/show'

  devise_for :users
  devise_scope :user do 
    authenticated :user do 
      root 'users#index', as: :authenticated_root
    end

    unauthenticated do 
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end  
end
