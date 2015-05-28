class AddAdditionalUnitsAndAbilityUpgradesToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :additional_units, :text
    add_column :players, :ability_upgrades, :text
  end
end
