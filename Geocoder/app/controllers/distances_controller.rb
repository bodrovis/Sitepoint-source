class DistancesController < ApplicationController
  def new
    @places = Place.all
  end

  def create
    @from = Place.find_by(id: params[:from])
    @to = Place.find_by(id: params[:to])
    if @from && @to
      flash[:success] =
          "The distance between <b>#{@from.title}</b> and <b>#{@to.title}</b> is #{@from.distance_from(@to.to_coordinates)} km"
    end
    redirect_to new_distance_path
  end
end