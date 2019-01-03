class AddDataToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :data, :text
  end
end
