class User < ActiveRecord::Base
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	def self.from_omniauth(auth)
	    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	      user.provider = auth.provider
	      user.uid = auth.uid
	      user.name = auth.info.name
	      user.oauth_token = auth.credentials.token
	      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	      user.save!
	    end
	end
end
