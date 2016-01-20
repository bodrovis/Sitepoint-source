class UsersController < ApplicationController
  before_action :check_access_token

  def show
    redirect_to "http://localhost:3000/api/user?access_token=#{session[:access_token]}"
  end

  def update
    redirect_to "http://localhost:3000/api/user/update?access_token=#{session[:access_token]}"
  end

  private

  def check_access_token
    redirect_to root_path unless session[:access_token]
    if session[:expires_at] <= Time.current
      req_params = "client_id=#{ENV['oauth_token']}&client_secret=#{ENV['oauth_secret']}&refresh_token=#{session[:refresh_token]}&grant_type=refresh_token&redirect_uri=#{ENV['oauth_redirect_uri']}"
      response = JSON.parse RestClient.post("#{ENV['server_base_url']}/oauth/token", req_params)
      set_oauth_info_from response
    end
  end
end