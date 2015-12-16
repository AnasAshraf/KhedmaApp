class User < ActiveRecord::Base
  # require 'fb_graph2'
	has_many :items ,dependent: :destroy
	has_many :friends ,dependent: :destroy
	has_many :users , :through => :friends 
	has_many :lendings ,dependent: :destroy
	has_many :posts,dependent: :destroy
	has_many :comments,dependent: :destroy
  has_many :pending_requests,dependent: :destroy
  
  # def self.authenticate(fbtoken)

  #     user = FbGraph2::User.me(fbtoken).fetch(fields: [:name,:email, :first_name, :last_name, :id , :picture,:nickname, :gender, :locale])
  #     uid = user.identifier
  #     name = user.name
  #     first_name = user.first_name
  #     last_name = user.last_name
  #     email = user.email
  #     photo = user.picture.url
  #     username = user.nickname
  #     location = user.locale
  #     gender = user.gender
  #     my_user = find_by(uid: uid)
  #     if my_user.present?
  #       my_user
  #     else
  #       create(
  #       provider: "facebook",
  #       uid: uid,
  #       name: name,
  #       email: email,
  #       photo: photo
  #        # first_name: first_name
  #        # last_name: last_name
  #        # username: username
  #        # gender:gender
  #        # location: location
  #       )
  #       find_by(uid: uid)
  #     end
  #   end

  #   def self.sign_in_from_omniauth(auth)
  #   user = find_by(provider: auth['provider'], uid: auth['uid'])

  #   if user.nil?
  #     user = create_user_from_omniauth(auth)
  #   end

  #   user
  # end

  #   def self.create_user_from_omniauth(auth)
  #   create(
  #     provider: auth['provider'],
  #     uid: auth['uid'],
  #     name: auth['info']['name'],
  #     email: auth['info']['email'],
  #     photo: auth['info']['image'],
  #     first_name: auth['info']['first_name'],
  #     last_name: auth['info']['last_name'],
  #     username: auth['info']['nickname'],
  #     gender: auth['info']['gender'],
  #     location: auth['info']['locale']
  #   )
  # end

 def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.username = auth.info.nickname
      user.photo = auth.info.image
      user.email = auth.info.email
      user.first_name =  auth.info.first_name
      user.last_name = auth.info.last_name
      user.gender = auth.info.gender
      user.location = auth.info.locale
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

#   def facebook
#   @facebook ||= Koala::Facebook::API.new(oauth_token)
#   block_given? ? yield(@facebook) : @facebook
# rescue Koala::Facebook::APIError
#   logger.info e.to_s
#   nil
# end

end
