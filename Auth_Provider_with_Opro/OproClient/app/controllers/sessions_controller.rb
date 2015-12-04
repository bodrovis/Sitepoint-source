class SessionsController < ApplicationController
  def create
    user = User.from_opro(OproApi.new.authenticate!(params[:code]))
    if user
      login user
      flash[:success] = "Welcome, #{user.email}!"
    else
      flash[:warning] = "Can't authenticate you..."
    end
    redirect_to root_path
  end

  def destroy
    logout
    flash[:success] = "See you!"
    redirect_to root_path
  end
end