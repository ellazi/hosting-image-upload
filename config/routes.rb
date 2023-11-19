Rails.application.routes.draw do
  get 'reviews/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "apartments#index"
  resources :apartments, except: [:index] do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
end
