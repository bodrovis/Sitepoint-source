class ChangeTypeInMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :type
    add_column :matches, :match_type, :string
  end
end
