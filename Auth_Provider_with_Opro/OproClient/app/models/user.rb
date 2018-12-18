class User < ActiveRecord::Base
  validates :access_token, presence: true
  validates :refresh_token, presence: true
  validates :expires_at, presence: true
  validates :uid, presence: true, uniqueness: true

  class << self
    def from_opro(auth = nil)
      return false unless auth
      user = User.find_or_initialize_by(uid: auth['uid'])
      user.access_token = auth['access_token']
      user.refresh_token = auth['refresh_token']
      user.expires_at = auth['expires_in'].seconds.from_now
      user.email = auth['email']
      user.save
      user
    end
  end

  def token_missing?
    !self.access_token.present?
  end

  def refresh_token_missing?
    !self.refresh_token.present?
  end

  def token_expired?
    self.expires_at < Time.current
  end

  def refresh_token!
    return unless token_expired?
    client = OproApi.new(refresh_token: self.refresh_token)
    User.from_opro(client.refresh!)
  end
end
