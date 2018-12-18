class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from RestClient::Unauthorized do
    flash[:warning] = 'No access rights to perform that action or your token has expired :('
    redirect_to root_path
  end

  private

  def new_opro_token_path
    "#{ENV['opro_base_url']}/oauth/new?client_id=#{ENV['opro_client_id']}&client_secret=#{ENV['opro_client_secret']}&redirect_uri=%2F%2Flocalhost%3A3001%2Foauth%2Fcallback"
  end

  def login(user)
    session[:user_id] = user.id
    current_user = user
  end

  def logout
    session.delete(:user_id)
    current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user=(user)
    @current_user = user
  end

  helper_method :new_opro_token_path, :current_user
end
