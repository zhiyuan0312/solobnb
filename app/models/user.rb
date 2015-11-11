class User < ActiveRecord::Base
	has_secure_password
  has_many :lisings

	def self.from_omniauth(auth)
    where(provider: auth[:provider], uid: auth.uid).first_or_create do |user|
      user.provider = auth[:provider]
      user.password = SecureRandom.hex(4)
      user.uid = auth.uid
      user.last_name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
