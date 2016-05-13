class Purse < ApplicationRecord
  belongs_to :user
  has_one :payment_history
end
