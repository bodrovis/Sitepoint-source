module ApplicationHelper
  def new_oauth_token_path
    "#{ENV['server_base_url']}/oauth/authorize?client_id=#{ENV['oauth_token']}&redirect_uri=#{ENV['oauth_redirect_uri']}&response_type=code&scope=public+write"
  end
end
