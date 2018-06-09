# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  namespace :v1, defaults: { format: :json }, constraints: ApiVersion.new('v1', true) do
    # Authentication
    post 'signup', to: 'users#create'
    post 'auth/login', to: 'authentication#authenticate'

    # Resources
    resources :users
    resources :posts do
      resoucres :comments
    end

    resources :stages
    resources :sessions
    resources :conversations do
      resources :messages
    end

    # Utilities
    get 'home/index'
    root to: 'home#index'
  end

  devise_for :users

  get '*path', to: 'application#fallback_index_html', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
