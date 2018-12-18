# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  popular    :boolean          default(FALSE)
#

class AlbumsController < ApplicationController
  def index
    @albums = Album.order('created_at DESC')
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:success] = "Album was created!"
      redirect_to albums_path
    else
      render :new
    end
  end

  private

  def album_params
    params.require(:album).permit(:title)
  end
end
