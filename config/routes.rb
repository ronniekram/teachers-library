Rails.application.routes.draw do
  resources :lesson_plans
  resources :books
  resources :users, only: [:show, :edit, :update] do 
    resources :books, only: [:show, :index]
    resources :lesson_plans, only: [:show, :index]
  end 

  root 'users#index'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  delete '/users/:id', to: 'users#destroy', as: '/delete'

  get '/sessions', to: 'sessions#new', as: 'login' 
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end