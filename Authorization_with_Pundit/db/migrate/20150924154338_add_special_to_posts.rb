class AddSpecialToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :special, :boolean, default: false
  end
end
