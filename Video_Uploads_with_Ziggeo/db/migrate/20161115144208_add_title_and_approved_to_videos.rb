class AddTitleAndApprovedToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :approved, :boolean, default: false
    add_index :videos, :approved
  end
end
