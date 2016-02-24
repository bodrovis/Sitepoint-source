# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_many :cart_items, dependent: :delete_all
  has_many :albums, through: :cart_items

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true

  before_validation -> {email.downcase!}

  def add_to_cart!(album)
    cart_item = self.cart_items.find_by(album_id: album)
    if cart_item
      cart_item.increment!(:quantity)
    else
      self.albums << album
    end
  end

  def remove_from_cart!(album)
    cart_item = self.cart_items.find_by(album_id: album)
    return unless cart_item
    if cart_item.quantity > 1
      cart_item.decrement!(:quantity)
    else
      cart_item.destroy!
    end
  end
end
