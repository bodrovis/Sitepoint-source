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
    redirect_to new_opro_token_path and return if current_user.token_missing?
    current_user.refresh_token! if current_user.token_expired?
  end

  def prepare_client
    @client = OproApi.new(current_user.access_token)
  end
end