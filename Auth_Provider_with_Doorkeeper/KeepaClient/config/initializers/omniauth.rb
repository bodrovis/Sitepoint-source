require File.expand_path('lib/omniauth/strategies/keepa', Rails.root)

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :keepa, ENV['oauth_token'], ENV['oauth_secret'], scope: 'public write'
  end