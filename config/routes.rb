Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      get '/air_quality', to: 'air_quality#show'
      resources :recipes, only: [:index]
      # resources :countries, only: [:index]
      # resources :air_quality, only: [:show]
    end
  end
end
