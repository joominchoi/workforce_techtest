Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "sign_up", to: "users#new"
  get "log_in", to: "sessions#new"
  post "log_in", to: "sessions#create"
  get "log_out", to: "sessions#destroy"
  get "welcome", to: "sessions#welcome"
  
  root to: "sessions#welcome"

  resources :users, :sessions, except: [:new]
  
end
