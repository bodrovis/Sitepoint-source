# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  album_id   :integer
#  quantity   :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :album

  validates :user, presence: true
  validates :album, presence: true
  validates :album, uniqueness: {scope: :user}
end
