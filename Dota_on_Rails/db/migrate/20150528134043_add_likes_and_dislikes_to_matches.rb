class AddLikesAndDislikesToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :likes, :integer
    add_column :matches, :dislikes, :integer
  end
end
