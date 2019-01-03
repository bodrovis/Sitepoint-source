class Album < ApplicationRecord
  has_many :songs, dependent: :delete_all
end
