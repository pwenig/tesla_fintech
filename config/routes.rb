Rails.application.routes.draw do

  # Not needed yet
  # devise_for :users
  root 'home#index'
  get 'contact', to: 'contacts#new'
  resources :services, only: [:index]
  resources :about, only: [:index]

  # Redirects routes to index if a wrong route is entered.
  get '*path' => redirect('/')

end
