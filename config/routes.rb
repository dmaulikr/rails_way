Rails.application.routes.draw do
  root 'games#index'

  resources :games, only: %i[index show]
end
