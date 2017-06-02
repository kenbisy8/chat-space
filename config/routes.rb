Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create]
  root 'messages#index'
end
