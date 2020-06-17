Rails.application.routes.draw do

  root 'users#index'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  delete '/users/:id', to: 'users#destroy'

  get '/sessions', to: 'sessions#new', as: '/login' 
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'

  resources :users, only: [:show, :edit, :update] do 
    resources :books, only: [:show, :index, :new, :edit]
    resources :lesson_plans, only: [:show, :index, :new, :edit]
  end 

  resources :books, only: [:create, :update, :destroy]
  resources :lesson_plans, only: [:create, :update, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end