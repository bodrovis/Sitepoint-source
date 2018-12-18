class CreatePersonalMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_messages do |t|
      t.text :body
      t.belongs_to :conversation, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
