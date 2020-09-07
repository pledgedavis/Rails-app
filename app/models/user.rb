class User < ApplicationRecord
    # has_many :brands
    has_many :shoes
    has_many :brands, through: :shoes 
    validates :username, :email, presence: true 
    validates :username, :email, uniqueness: true 
    has_secure_password







    def self.from_omniauth(auth)
        #there are many ways to do it
          where(email: auth.info.email).first_or_initialize do |user|
            user.username = auth.info.name
            user.email = auth.info.email
            user.password = SecureRandom.hex
          end
        end
end