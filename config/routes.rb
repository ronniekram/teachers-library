Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: [:show, :edit, :update] do 
    resources :books, only: [:show, :index, :new, :edit]
    resources :lesson_plans, only: [:show, :index, :new, :edit]
  end 

  resources :books, only: [:create, :update, :destroy]
  resources :lesson_plans, only: [:create, :update, :destroy]

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
