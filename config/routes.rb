Rails.application.routes.draw do
 
  get "ang/index"
  get "ang/matches_close"
  get "ang/bets"
  
  resources :notifications

  get "about/index"
  resources :calculation_configs

  post "generate/bets"
  get "generate/bets"
  post "generate/calculate"
  get "generate/calculate"
  post "generate/battles"
  get "generate/battles"
  
  get "administrator/index"
  resources :battles

  resources :calculations

  resources :bets

  resources :matches

  resources :players

  get "main/login"
  get "main/index"
  get "main/access_denied"
  get "main/my_bets"
  
  resources :teams


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'

  # get '/auth/:facebook/callback', to: 'sessions#create'

  match 'auth/:facebook/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]


end