class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :uid
      t.string :avatar_url
      t.string :profile_url

      t.timestamps null: false
    end

    add_index :users, :uid, unique: true
  end
end
