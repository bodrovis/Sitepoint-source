class ClickTrack < ApplicationRecord
  belongs_to :item

  scope :for_item, -> (item) { joins(:tweet).where(tweets: {project_id: project.id}) }
end
