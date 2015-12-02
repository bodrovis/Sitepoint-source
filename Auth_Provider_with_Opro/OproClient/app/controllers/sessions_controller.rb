class SessionsController < ApplicationController
  def create
    if current_user.obtain_token!(params[:code])
      flash[:success] = "Welcome!"
    else
      flash[:warning] = "Can't authenticate you..."
    end
    redirect_to root_path
  end
end