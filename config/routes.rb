Rails.application.routes.draw do
  devise_for :users

  root "updates#index"

  resources :books, only: [:index, :show]
  resources :orders, only: [:create]
  # resources :users, only: [:index, :show]
end
