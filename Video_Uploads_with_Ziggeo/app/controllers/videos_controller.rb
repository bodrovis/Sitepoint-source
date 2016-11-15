class VideosController < ApplicationController
  def new
  end

  def index
    ziggeo = Ziggeo.new(ENV['ZIGGEO_KEY'], ENV['ZIGGEO_SECRET'], ENV['ZIGGEO_ENCRYPTION'])
    @videos = ziggeo.videos.index(tags: current_user.uid)
  end
end