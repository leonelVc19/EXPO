class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         devise: :omniauthable

         has_many :articles


         def self.find_for_facebook_oauth(auth)
          user = User.where(provider: auth.provider, uid: auth.uid).first
          return user if user
          user = User.where(email: auth.info.email).first
          return user if user
          User.create(
          name: auth.extra.raw_info.name,
          provider: auth.provider,
          uid: auth.uid,
          emai: auth.info.email,
          image: auth.info.image,
          password: Devise.friendly_token[0,20])
        end
end
