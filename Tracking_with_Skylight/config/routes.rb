Rails.application.routes.draw do
  resources :albums, only: [:create]

  root 'albums#index'
end
