class AddPopularToAlbums < ActiveRecord::Migration
  def change
    unless column_exists? :albums, :popular
      add_column :albums, :popular, :boolean
      add_index :albums, :popular
    end
  end
end
