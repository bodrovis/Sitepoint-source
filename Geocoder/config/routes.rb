Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  resources :places, except: [:update, :edit, :destroy]
  resources :distances, only: [:new, :create]

  root 'places#index'
end
