Rails.application.routes.draw do
  resources :products, only: [:index, :show]

  get '/restricted', to: 'pages#restricted'

  root 'pages#index'
end
