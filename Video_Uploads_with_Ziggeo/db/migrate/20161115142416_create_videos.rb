class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :uid
      t.belongs_to :user, foreign_key: true
      t.decimal :duration, scale: 2, precision: 5
      t.datetime :ziggeo_created_at

      t.timestamps
    end
  end
end
