Rails.application.routes.draw do
  devise_for :users
  root 'words#index'
  resources :user,only: [:edit,:update]
  resources :groups, only: [:new, :create]
end
