class AlbumsController < ApplicationController
  def index
    if params[:published] == 't'
      @albums = Album.includes(:songs).where(published: true)
    else
      @albums = Album.includes(:songs).order('published DESC')
    end
  end

  def create
    Album.transaction do
      50.times do
        Album.create({title: Faker::Book.title, musician: Faker::StarWars.character})
      end
    end
    redirect_to root_path
  end
end