class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def doorkeeper_unauthorized_render_options(error: nil)
    { json: { error: "Not authorized" } }
  end

  helper_method :current_user
end
