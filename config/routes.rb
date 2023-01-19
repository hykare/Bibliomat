Rails.application.routes.draw do
  devise_for :users

  root "updates#landing"

  resources :books, only: [:index, :show]
  resources :orders, only: [:create]
  # resources :users, only: [:index, :show]
end
