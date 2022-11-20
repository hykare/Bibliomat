Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "test1#index"
  get '/tavern', to: 'tavern#index'

  resources :users, only: [:index, :show]
end
