class Place < ApplicationRecord
  has_many :addresses, dependent: :destroy, inverse_of: :place

  accepts_nested_attributes_for :addresses, allow_destroy: true,
                                reject_if: ->(attrs) { attrs['city'].blank? || attrs['street'].blank? }
end
