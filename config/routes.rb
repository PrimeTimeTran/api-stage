# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json }, constraints: ApiVersion.new('v1', true) do

    mount ActionCable.server => '/cable'

    # Authentication
    post 'signup', to: 'users#create'
    post 'auth/login', to: 'authentication#authenticate'

    # Resources
    resources :posts
    resources :stages
    resources :sessions

    # Utilities
    get 'home/index'
    root to: 'home#index'
  end

  devise_for :users

  get '*path', to: 'application#fallback_index_html', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
