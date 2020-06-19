Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => 'callbacks' }  
  
    devise_scope :user do 
      get 'login', to: 'devise/sessions#new'
    end 
    devise_scope :user do 
      get 'signup', to: 'devise/registrations#new'
    end 

  resources :users, only: [:show, :edit, :update] do 
    resources :books, only: [:show, :index, :new, :edit]
    resources :lesson_plans, only: [:show, :index, :new, :edit]
  end 

  resources :books, only: [:create, :update, :destroy]
  resources :lesson_plans, only: [:create, :update, :destroy]

end