# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  popular    :boolean          default(FALSE)
#

class Album < ApplicationRecord
  has_many :cart_items, dependent: :delete_all
  has_many :users, through: :cart_items

  validates :title, presence: true
  validates :title, length: {maximum: 100}

  scope :popular, -> { where(popular: true) }
end
