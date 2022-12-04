Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "test1#index"
  get '/tavern', to: 'tavern#index'
  
  resources :characters, only: [:index, :show, :new, :create]
  resources :users, only: [:index, :show]
  resources :quests, except: [:show]
end
