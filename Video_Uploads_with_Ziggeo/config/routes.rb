Rails.application.routes.draw do
  devise_for :users
  resources :videos, only: [:new, :index, :destroy]

  namespace :api do
    resources :video_callbacks, only: [:create]
  end
  root 'videos#index'
end
