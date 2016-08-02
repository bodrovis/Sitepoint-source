Rails.application.routes.draw do
  resources :items, only: [:index] do
    resources :click_tracks, only: [:index]
  end

  namespace :api do
    resources :click_tracks, only: [:create] do
      member do
        get 'by_day'
      end
    end
  end

  root 'items#index'
end
