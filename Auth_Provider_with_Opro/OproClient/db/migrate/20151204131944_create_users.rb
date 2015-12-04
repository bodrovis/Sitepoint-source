class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, index: true
      t.string :uid, index: true
      t.string :access_token
      t.string :refresh_token
      t.string :expires_at

      t.timestamps null: false
    end
  end
end
