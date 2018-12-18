# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
  has_many :pins
  belongs_to :user

  def user_pin(user = nil)
    self.pins.where(user: user).first
  end
end
