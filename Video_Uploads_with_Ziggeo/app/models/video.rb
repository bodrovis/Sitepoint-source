class Video < ApplicationRecord
  belongs_to :user

  validates :uid, presence: true, uniqueness: true

  def approve!
    self.approved = true
    self.save
  end

  def self.from_api(data)
    user = User.find_by(uid: data['tags'][0])
    video = user.videos.find_or_initialize_by(uid: data['token'])
    video.ziggeo_created_at = Time.at(data['created'])
    video.duration = data['duration']
    video.save
  end
end
