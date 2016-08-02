class CreateClickTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :click_tracks do |t|
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
