class User < ActiveRecord::Base
	has_many :items 
	has_many :friends
	has_many :users , :through => :friends
	has_many :lendings
	has_many :posts
	has_many :comments
  has_many :pending_requests
  
 def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.username = auth.info.nickname
      user.photo = auth.info.image
      user.email = auth.info.email
      user.first_name =  auth.info.first_name
      user.last_name = auth.info.last_name
      user.gender = auth.info.gender
      user.location = auth.info.location
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
