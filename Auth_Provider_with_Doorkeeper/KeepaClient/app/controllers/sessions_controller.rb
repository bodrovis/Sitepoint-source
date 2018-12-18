class SessionsController < ApplicationController
  def create
    set_oauth_info_from request.env['omniauth.auth']['credentials']
    redirect_to root_path
  end
end