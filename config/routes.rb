Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:edit, :update] do
    collection do
      get 'search'
    end
  end
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end
  root 'top#index'
end
