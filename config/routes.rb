Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resources :questions do
    resources :answers
  end
  get 'logout', to: 'sessions#destroy', as: :logout
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
