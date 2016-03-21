Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/create'

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
