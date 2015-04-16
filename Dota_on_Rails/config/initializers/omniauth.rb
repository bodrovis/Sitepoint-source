Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, ENV['STEAM_KEY']
end