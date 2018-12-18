class AddOngoingToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :ongoing, :boolean, default: true
    add_index :projects, :ongoing
  end
end
