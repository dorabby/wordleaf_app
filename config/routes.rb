Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :users,only: [:index,:edit,:update]
  resources :books, only: [:index,:new, :create,:edit,:update] do
    resources :words do
      collection do
        get 'search'
      end
    end
  end
end
