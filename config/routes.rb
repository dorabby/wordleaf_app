Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :user,only: [:edit,:update]
  resources :books, only: [:index,:new, :create,:edit,:update]
end
