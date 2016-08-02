class ClickTracksController < ApplicationController
  def index
    @item = Item.find_by(id: params[:item_id])
  end
end