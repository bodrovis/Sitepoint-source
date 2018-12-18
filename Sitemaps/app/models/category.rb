class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
end
