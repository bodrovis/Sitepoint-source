class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.order('created_at DESC')
  end
end