class PagesController < ApplicationController
  before_action :authenticate!, only: [:restricted]

  caches_page :index
  caches_action :restricted

  def index
  end

  def restricted
  end

  private

  def authenticate!
    params[:admin] == 'true'
  end
end