class ChangeUidInMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :uid
    add_column :matches, :uid, :integer, index: true, unique: true, null: false
  end
end
