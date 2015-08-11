class AddPersistenceTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :persistence_token, :string
  end
end
