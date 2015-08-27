class PagesController < ApplicationController
  before_action :require_login, only: [:new]

  def index

  end

  def new

  end
end