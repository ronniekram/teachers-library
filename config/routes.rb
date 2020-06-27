Rails.application.routes.draw do 
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks => 'callbacks'}
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'  
  end

  root 'home#index'
  # resources :users, only: [:show, :edit, :update, :destroy]
  resources :lesson_plans
  resources :books, except: [:destroy]
  resources :subjects, only: [:new, :create]

  # resources :users, only: [:show, :edit, :update] do 
  #   resources :books, only: [:show, :index, :new, :edit]
  #   resources :lesson_plans, only: [:show, :index, :new, :edit]
  #   resources :subjects, only: [:destroy]
  # end 

  # resources :books, only: [:create, :update, :destroy]
  # resources :lesson_plans, only: [:create, :update, :destroy]

end