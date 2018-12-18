class AddTowersStatusAndBarracksStatusToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :towers_status, :text
    add_column :matches, :barracks_status, :text
  end
end
