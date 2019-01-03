Rails.application.routes.draw do
  resources :animals, only: [:index, :new, :create]

  root to: 'animals#index'
end
