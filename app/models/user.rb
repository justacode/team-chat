class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  validates :first_name, :last_name, presence: true
  has_many :messages, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      full_name = auth.info.name.split(' ')
      user.first_name = full_name.first
      user.last_name = full_name.last
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def online
    REDIS.sadd("online", "#{self.first_name} #{self.last_name}")
    AppearanceJob.perform_later list
  end

  def offline
    REDIS.srem("online", "#{self.first_name} #{self.last_name}")
    AppearanceJob.perform_later list
  end

  def list
    REDIS.smembers("online")
  end
end
