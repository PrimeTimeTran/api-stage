Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Authentication
      post 'signup', to: 'users#create'
      post 'auth/login', to: 'authentication#authenticate'

      # Resources
      resources :posts
      resources :stages
      resources :sessions

      # Utilities
      get 'home/index'
      root to: "home#index"
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
