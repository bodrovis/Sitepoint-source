class AddMissingIndexes < ActiveRecord::Migration[5.0]
  def change
    remove_column :videos, :data
    add_index :videos, :uid, unique: true
  end
end