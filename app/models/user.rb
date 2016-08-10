class User < ActiveRecord::Base

  has_many :services
  has_many :orders
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :full_name, presence: true, length: { maximum: 50}

  def self.from_omniauth(auth)
  	user = User.where(email: auth.info.email).first
  	if user
  		return user
  	else
  	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  			user.provider = auth.provider
  			user.uid = auth.uid
  			user.full_name = auth.info.name
  			user.description = auth.info.description
  			user.email = auth.info.email
  			user.image = auth.info.image
  			user.password = Devise.friendly_token[0,20]
  		end
  	end
  end
end
