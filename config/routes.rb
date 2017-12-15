Rails.application.routes.draw do

  root 'home#index'
  resources :contact
  resources :services, only: [:index]
  resources :about, only: [:index]
end
