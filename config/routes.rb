Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :users
  resources :days
  resources :stickers
  resources :posts
  resources :day_stickers

  
end
