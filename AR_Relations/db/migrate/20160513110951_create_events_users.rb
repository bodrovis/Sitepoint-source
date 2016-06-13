class CreateEventsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :events_users do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
    end
  end
end
