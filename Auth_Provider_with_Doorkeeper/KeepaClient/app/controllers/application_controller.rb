class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def set_oauth_info_from(response)
    session[:access_token] = response['access_token'] || response['token']
    session[:refresh_token] = response['refresh_token']
    if response['expires_in']
      session[:expires_at] = response['expires_in'].seconds.from_now
    else
      session[:expires_at] = Time.at response['expires_at']
    end
  end
end
