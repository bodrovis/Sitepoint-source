class CreateUsersEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :users_events do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
    end
  end
end
