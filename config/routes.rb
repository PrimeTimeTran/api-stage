Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts

      devise_for :users

      get 'home/index'
      root to: "home#index"
    end
  end

  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
