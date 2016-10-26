class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true

  after_create_commit do
    conversation.touch
    NotificationBroadcastJob.perform_later(self)
  end

  def receiver
    if conversation.author == conversation.receiver || conversation.receiver == user
      conversation.author
    else
      conversation.receiver
    end
  end
end
