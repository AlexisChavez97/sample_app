Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/index', to: 'users#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/memes', to: 'memes#index'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :memes
  resources :users
  resources :posts,          only: [:create, :destroy]
  resources :relationships,  only: [:create, :destroy]
end
