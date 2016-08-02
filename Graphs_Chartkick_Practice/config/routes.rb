Rails.application.routes.draw do
  resources :items, only: [:index] do
    resources :click_tracks, only: [:index]
  end

  namespace :api do
    resources :items, only: [] do
      resources :click_tracks, only: [:create] do
        collection do
          get 'by_day'
        end
      end
    end
  end

  root 'items#index'
end