Rails.application.routes.draw do
  get 'auth/register'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :users
  resources :days
  resources :stickers
  resources :posts
  resources :day_stickers
  resources :notes

  # get "/autologin", to: "auth#autologin"

  post "/register", to: "auth#register"
  post "/login", to: "auth#login"
  get "/profile", to: "users#show"

  
end
