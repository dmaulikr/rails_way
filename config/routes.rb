Rails.application.routes.draw do
  root 'pages#index'

  get 'about',        to: 'pages#about'
  get 'instructions', to: 'pages#instructions'

  resources :games, param: :level, only: %i[index show] do
    member do
      post :check
    end
  end
end
