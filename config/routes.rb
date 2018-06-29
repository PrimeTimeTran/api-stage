# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  namespace :v1, defaults: { format: :json }, constraints: ApiVersion.new('v1', true) do
    # Authentication
    post 'signup', to: 'users#create'
    post 'auth/login', to: 'authentication#authenticate'

    resources :users do
      collection do
        get 'search'
      end
    end

    resources :conversations do
      resources :messages
      member do
        get 'users'
      end
      collection do
        get 'present'
      end
    end

    resources :posts do
      resources :comments
    end

    resources :uploads
    resources :stages
    resources :user_conversations
    resources :reactions, only: [:create, :destroy]
    resources :friendships
    resources :sessions

    # Utilities
    get 'home/index'
  end

  root to: 'home#index'

  devise_for :users

  get '*path', to: 'application#fallback_index_html', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
