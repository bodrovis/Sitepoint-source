class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
