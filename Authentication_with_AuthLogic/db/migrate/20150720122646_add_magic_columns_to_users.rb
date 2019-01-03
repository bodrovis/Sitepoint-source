class AddMagicColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login_count, :integer, :null => false, :default => 0
    add_column :users, :failed_login_count, :integer, :null => false, :default => 0
    add_column :users, :last_request_at, :datetime
    add_column :users, :current_login_at, :datetime
    add_column :users, :last_login_at, :datetime
    add_column :users, :current_login_ip, :string
    add_column :users, :last_login_ip, :string
  end
end
