Rails.application.routes.draw do 
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks => 'callbacks'}

  root 'home#index'
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'  
  end

  scope '/users' do 
    resources :lesson_plans
  end 
  
  resources :books, except: [:destroy]
  resources :subjects, only: [:index, :new, :create]
end