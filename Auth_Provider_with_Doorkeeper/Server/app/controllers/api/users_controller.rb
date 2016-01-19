class Api::UsersController < ApplicationController
  before_action -> { doorkeeper_authorize! :public }, only: :index
  before_action -> { doorkeeper_authorize! :write }, only: :update

  def show
    render json: current_resource_owner.as_json
  end

  def update
    render json: { result: current_resource_owner.touch(:updated_at) }
  end

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end