class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create

  def create
    #render text: request.env['omniauth.auth'].to_yaml and return

    begin
      @user = User.from_omniauth request.env['omniauth.auth']
    rescue
      flash[:error] = "Can't authorize you..."
    else
      @user.load_matches!(3)
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.nickname}!"
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = "Goodbye!"
    end
    redirect_to root_path
  end
end