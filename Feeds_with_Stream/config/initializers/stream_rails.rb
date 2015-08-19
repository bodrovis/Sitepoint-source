require 'stream_rails'

StreamRails.configure do |config|
  config.api_key     = ENV["STREAM_KEY"]
  config.api_secret  = ENV["STREAM_SECRET"]
  config.timeout     = 30
end