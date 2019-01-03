class AddPublishedToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :published, :boolean, default: false
  end
end
