# == Route Map
#

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "eggs#index"

  resources :eggs, only: %i[show] do
    resources :answers, only: %i[create update]
  end

  get :login, to: "sessions#new"
  post :login, to: "sessions#initiate"
  get :authorize, to: "sessions#create"
  delete :logout, to: "sessions#destroy"

  get :rules, to: "static#rules"

  match "/404", to: "static#not_found", via: :all
  match "/500", to: "static#internal_server_error", via: :all

  namespace :admin do
    root "dashboard#index"
    resources :eggs, only: %i[create edit update destroy] do
      resources :hints, only: %i[create destroy]
    end
    resources :answers, only: %i[index show update]

    get :rules, to: "rules#edit"
    patch :rules, to: "rules#update"
  end
end
