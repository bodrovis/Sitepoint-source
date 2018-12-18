class AddMissingIndexToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_index :albums, :published
  end
end
