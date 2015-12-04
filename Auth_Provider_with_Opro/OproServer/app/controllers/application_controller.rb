class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private

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
