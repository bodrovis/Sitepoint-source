# == Schema Information
#
# Table name: matches
#
#  id          :integer          not null, primary key
#  uid         :integer          not null
#  user_id     :integer
#  winner      :string
#  first_blood :string
#  started_at  :datetime
#  mode        :string
#  duration    :string
#  cluster     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  match_type  :string
#

class Match < ActiveRecord::Base
  belongs_to :user
  has_many :players, dependent: :delete_all

  def load_players!(radiant, dire)
    roster = {radiant: radiant, dire: dire}
    roster.each_pair do |k, v|
      v.players.each do |player|
        self.players.create({
                                uid: player.id,
                                items: player.items.delete_if {
                                    |item| item.name == "Empty"
                                }.map  {
                                    |item| {id: item.id, name: item.name, image: item.image_url}
                                },
                                hero: {id: player.hero.id,
                                       name: player.hero.name,
                                       image: player.hero.image_url},
                                level: player.level,
                                kills: player.kills,
                                deaths: player.deaths,
                                assists: player.assists,
                                last_hits: player.last_hits,
                                denies: player.denies,
                                gold: player.gold,
                                gpm: player.gpm,
                                xpm: player.xpm,
                                status: player.status,
                                gold_spent: player.gold_spent,
                                hero_damage: player.hero_damage,
                                tower_damage: player.tower_damage,
                                hero_healing: player.hero_healing,
                                slot: player.slot,
                                radiant: k == :radiant
                            })
      end
    end
  end
end
