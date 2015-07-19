class UsersController < ApplicationController
  before_action :require_no_user, only: [:new, :create]
  before_action :require_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_to root_path
    else
      render :action => :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :edit
    end
  end

  private

  def users_params
    params.require(:user).permit(:email)
  end
end