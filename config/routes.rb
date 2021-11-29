Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "sign_up", to: "users#new"

  get "log_in", to: "sessions#new"
  post "log_in", to: "sessions#create"

  get "log_out", to: "sessions#destroy"

  get "welcome", to: "sessions#welcome"

  get "overview", to: "sessions#overview"
  
  get "password/reset", to: "password_resets#new"

  put "leave/:id", to: "users#leave_organisation", :as => "leave_organisation"
  put "join/:id", to: "users#join_organisation", :as => "join_organisation"

  root to: "sessions#overview"

  resources :users, :sessions, :organisations, except: [:new]
  
end
