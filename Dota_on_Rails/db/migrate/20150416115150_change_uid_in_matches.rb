class ChangeUidInMatches < ActiveRecord::Migration
  def change
    change_column :matches, :uid, :integer, index: true, unique: true, null: false
  end
end
