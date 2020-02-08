Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :users,only: [:edit,:update]
  resources :books, only: [:index,:new, :create,:edit,:update] do
    resources :words,only:[:index,:show,:new,:create,:edit,:update]
  end
end
