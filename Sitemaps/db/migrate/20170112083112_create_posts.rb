class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :category, foreign_key: true
      t.text :body
      t.string :title

      t.timestamps
    end
  end
end
