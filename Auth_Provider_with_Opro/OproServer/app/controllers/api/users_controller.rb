class Api::UsersController < ApplicationController
  allow_oauth!
  require_oauth_permissions :update, only: :update

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.email = params[:email]
    render json: {result: @user.save}
  end
end