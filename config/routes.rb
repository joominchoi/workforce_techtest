Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "sign_up", to: "users#new"
  get "log_in", to: "sessions#new"
  post "log_in", to: "sessions#create"
  delete "log_out", to: "sessions#destroy"
  resources :users, except: [:new]
end
