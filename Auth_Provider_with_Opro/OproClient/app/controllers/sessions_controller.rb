class SessionsController < ApplicationController
  def create
    response = JSON.parse RestClient.post("#{ENV['opro_base_url']}/oauth/token.json",
                    {
                        client_id: ENV['opro_client_id'],
                        client_secret: ENV['opro_client_secret'],
                        code: params[:code]
                    },
                    accept: :json)
    session[:access_token] = response['access_token']
    session[:refresh_token] = response['refresh_token']
    redirect_to root_path
  end
end