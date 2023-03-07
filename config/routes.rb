Rails.application.routes.draw do
  get 'splash/index'
  devise_for :users

  devise_scope :user do
    authenticated do
      root to: 'groups#index', as: 'user'
    end

    unauthenticated do
      root to: 'root#index', as: 'unauthenticated_user_root'
    end

    get '/sign_out', to: 'devise/sessions#destroy'
  end

  resources :groups do
    resources :moves
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "root#index"
end
