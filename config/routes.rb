Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "test1#index"
  get '/tavern', to: 'tavern#index'
  get '/ranking', to: 'tavern#ranking'

  resources :characters, only: [:index, :show, :new, :create]
  resources :users, only: [:index, :show]
  resources :quest_templates, except: [:show]
  patch 'reward', to: 'quest_rewards#reward', as: 'reward'
end
