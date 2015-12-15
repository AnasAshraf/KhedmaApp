class User < ActiveRecord::Base
	has_many :items 
	has_many :friends
	has_many :users , :through => :friends
	has_many :lendings
	has_many :posts
	has_many :comments
  has_many :pending_requests




  before_save { self.email = email.downcase if not self.email.blank?}
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :username, presence:true, uniqueness: true, length: { maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, :on => :create
 # validates_confirmation_of :password, length: { minimum: 6 }
  #has_secure_password validations: false
end