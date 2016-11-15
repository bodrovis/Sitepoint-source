class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :videos, dependent: :destroy

  validates :email, presence: true
  before_create -> { self.uid = generate_uid }

  private

  def generate_uid
    loop do
      uid = Digest::MD5.hexdigest(self.email + self.created_at.to_s + rand(10000).to_s)
      return uid unless User.exists?(uid: uid)
    end
  end
end
