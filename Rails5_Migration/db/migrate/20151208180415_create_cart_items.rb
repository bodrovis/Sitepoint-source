class CreateCartItems < ActiveRecord::Migration
  def change
    unless table_exists? :cart_items
      create_table :cart_items do |t|
        t.references :user, index: true, foreign_key: true
        t.references :album, index: true, foreign_key: true
        t.integer :quantity, default: 1

        t.timestamps null: false
      end

      add_index :cart_items, [:user_id, :album_id], unique: true
    end
  end
end
