Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts


      get 'home/index'
      root to: "home#index"
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
