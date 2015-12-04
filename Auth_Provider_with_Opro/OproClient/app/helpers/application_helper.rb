module ApplicationHelper
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
end
