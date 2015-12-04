class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  private

  def oauth_valid_password_auth?(client_id, client_secret)
    client_id == '24111b671c3675d3a1d133acd1d6388f'
  end

  def oauth_client_record_access!(client_id, params)
    client_app = Opro::Oauth::ClientApp.find(client_id)
    if client_app.last_request_at < Date.today
      client_app.last_request_at = Date.today
      client_app.requests_count = 1
    else
      client_app.requests_count += 1
    end
    client_app.save
  end

  def oauth_client_rate_limited?(client_id, params)
    return false
    client_app = Opro::Oauth::ClientApp.find(client_id)
    client_app.requests_count > 2
  end
end
