class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def token_missing?
    !self.access_token.present?
  end

  def token_expired?
    !self.expires_at.present? || self.expires_at < Time.current
  end

  def obtain_token!(code)
    return unless token_missing?
    self.from_opro OproApi.authenticate!(code)
  end

  def refresh_token!
    return unless token_expired?
    self.from_opro OproApi.refresh!(self.refresh_token)
  end

  def from_opro(auth)
    self.access_token = auth['access_token']
    self.refresh_token = auth['refresh_token']
    self.expires_at = auth['expires_in'].seconds.from_now
    self.save
  end
end
