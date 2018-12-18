class Competition < ApplicationRecord
  has_many :competition_results
  has_many :sporters, through: :competition_results
end
