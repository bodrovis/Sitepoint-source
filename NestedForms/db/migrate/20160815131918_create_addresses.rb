class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.belongs_to :place, foreign_key: true

      t.timestamps
    end
  end
end
