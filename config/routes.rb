Rails.application.routes.draw do
  devise_for :users
  get 'reviews/new'
  get '/about', to: 'pages#about'
  get '/crisis', to: 'pages#crisis'

  root "apartments#index"
  resources :apartments, except: [:index] do
    resources :reviews, only: [:new, :create]
    resources :visits, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
  resources :visits, only: [:destroy]
  resources :posts, only: [:index, :show, :new, :create, :destroy]
end
