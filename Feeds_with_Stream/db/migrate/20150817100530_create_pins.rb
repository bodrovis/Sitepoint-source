class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.text :message

      t.timestamps null: false
    end
  end
end
