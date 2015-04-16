class ChangeFirstBloodInMatches < ActiveRecord::Migration
  def change
    change_column :matches, :first_blood, :string
  end
end
