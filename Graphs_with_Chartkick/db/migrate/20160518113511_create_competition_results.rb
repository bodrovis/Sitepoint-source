class CreateCompetitionResults < ActiveRecord::Migration[5.0]
  def change
    create_table :competition_results do |t|
      t.references :sporter, foreign_key: true
      t.references :competition, foreign_key: true
      t.integer :place

      t.timestamps
    end
  end
end
