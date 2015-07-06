Rails.application.routes.draw do
  root 'users#index'

  resources :users, :questions
  

  get 'logout', to: 'sessions#destroy', as: :logout
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
