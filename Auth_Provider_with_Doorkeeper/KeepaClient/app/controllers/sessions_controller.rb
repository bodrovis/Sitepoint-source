class SessionsController < ApplicationController
  def create
    req_params = "client_id=#{ENV['oauth_token']}&client_secret=#{ENV['oauth_secret']}&code=#{params[:code]}&grant_type=authorization_code&redirect_uri=#{ENV['oauth_redirect_uri']}"
    response = JSON.parse RestClient.post("#{ENV['server_base_url']}/oauth/token", req_params)
    session[:access_token] = response['access_token']
    redirect_to root_path
  end
end