# == Schema Information
#
# Table name: players
#
#  id               :integer          not null, primary key
#  match_id         :integer
#  uid              :string
#  hero             :text
#  level            :integer
#  kills            :integer
#  deaths           :integer
#  assists          :integer
#  last_hits        :integer
#  denies           :integer
#  gold             :integer
#  gpm              :integer
#  xpm              :integer
#  status           :string
#  gold_spent       :integer
#  hero_damage      :integer
#  tower_damage     :integer
#  hero_healing     :integer
#  items            :text
#  slot             :integer
#  radiant          :boolean          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  additional_units :text
#  ability_upgrades :text
#

class Player < ActiveRecord::Base
  belongs_to :match

  serialize :hero
  serialize :items
  serialize :additional_units
  serialize :ability_upgrades

  def abandoned_or_not_connected?
    status != 'played'
  end
end
