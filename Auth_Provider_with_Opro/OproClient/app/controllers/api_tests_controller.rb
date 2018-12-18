class ApiTestsController < ApplicationController
  before_action :check_token
  before_action :prepare_client

  def index
    @response = @client.test_api
  end

  def show
    @response = @client.get_user(params[:id])
  end

  def update
    @response = @client.update_user(params[:id])
  end

  private

  def check_token
    redirect_to new_opro_token_path and return if
        !current_user || current_user.token_missing? ||
            (current_user.token_expired? && current_user.refresh_token_missing?)
    if current_user.token_expired?
      updated_current_user = current_user.refresh_token!
      if updated_current_user
        login updated_current_user
      else
        flash[:warning] = "There was an error while trying to refresh your token..."
        redirect_to root_path
      end
    end
  end

  def prepare_client
    @client = OproApi.new(access_token: current_user.access_token)
  end
end