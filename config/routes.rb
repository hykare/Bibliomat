Rails.application.routes.draw do
  devise_for :users

  root "updates#index"
  # get '/tavern', to: 'tavern#index'

  # resources :characters, only: [:index, :show, :new, :create]
  # resources :statistics, only: [:update]

  # resources :users, only: [:index, :show]
  # patch 'reward', to: 'quest_rewards#reward', as: 'reward'
end
