class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :uid, null: false
      t.references :user, index: true, foreign_key: true
      t.string :winner
      t.integer :first_blood
      t.datetime :started_at
      t.string :mode
      t.string :duration
      t.string :cluster

      t.timestamps null: false
    end
  end
end
