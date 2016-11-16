class VideosController < ApplicationController
  def new
  end

  def index
    #ziggeo = Ziggeo.new(ENV['ZIGGEO_KEY'], ENV['ZIGGEO_SECRET'], ENV['ZIGGEO_ENCRYPTION'])
    #@videos = ziggeo.videos.index(tags: current_user.uid)
    @videos = current_user.videos.where(approved: true)
  end

  def destroy
    video = current_user.videos.find_by(uid: params[:id])
    if video
      ziggeo = Ziggeo.new(ENV['ZIGGEO_KEY'], ENV['ZIGGEO_SECRET'], ENV['ZIGGEO_ENCRYPTION'])
      ziggeo.videos.delete(video.uid)
      flash[:success] = 'Video removed! It may take some time to reflect changes on the website.'
    else
      flash[:warning] = 'Cannot find such video...'
    end
    redirect_to root_path
  end
end