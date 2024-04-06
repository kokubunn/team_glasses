Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root to: "main#index"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :tasks
  post "getpoint", to: "tasks#get_point"
  get "signup", to: "signup#new"
  post "signup", to: "signup#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  # Defines the root path route ("/")
  # root "posts#index"
end
