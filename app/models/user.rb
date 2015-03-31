class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google]

  def self.from_omniauth(auth)
  new_user = false

  facebook_user = where(auth.slice(:provider, :uid)).first_or_create do |user|
   user.email = auth.info.email || "#{auth.uid}@facebook.com"
   user.password = Devise.friendly_token[0,20]
   user.name = auth.info.name
   user.image = "#{auth.info.image}?type=large"
   new_user = true
  end

  # Update already existing user
  unless new_user
   facebook_user.email = auth.info.email if auth.info.email
   facebook_user.name = auth.info.name
   facebook_user.image = "#{auth.info.image}?type=large"
   facebook_user.save
  end

  facebook_user
  end
end
