Rails.application.routes.draw do
  resources :lesson_plans
  resources :books
  resources :users, except: [:index, :new, :create, :destroy] do 
    resources :books, only: [:show, :index]
    resources :lesson_plans, only: [:show, :index]
  end 

  root 'users#index'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  delete '/delete', to: 'users#destroy'

  get '/login', to: 'sessions#new', as: 'login' 
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
