Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :categories do
      resources :posts
    end

    root to: 'pages#index'
  end

  get '/sitemap', to: 'pages#sitemap'
end