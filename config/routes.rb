Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show, :create] do
        post "/shots", to: "games/shots#create"
        post "/ships", to: "games/ships#create"
      end
    end
  end
  resources :verification

  resources :users do
    member do
      get :confirm_email
    end
  end
  get 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  root to: 'home#index'
  get '/register', to: 'register#show'
  get 'dashboard', to: 'dashboard#show'
  get '/confirmation', to: 'confirmation#show'
end
