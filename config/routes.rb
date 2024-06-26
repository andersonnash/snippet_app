Rails.application.routes.draw do
  root 'home#show'

  get 'auth/:provider/callback', to: 'sessions#google_auth'
  get 'auth/failure', to: redirect('/')
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :users
  resources :sessions
  resources :snippets
  resources :feed, only: [:index]
end
