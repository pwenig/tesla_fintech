Rails.application.routes.draw do

  root 'home#index'
  get 'contact', to: 'contacts#new'
  resources :services, only: [:index]
  resources :about, only: [:index]
end
