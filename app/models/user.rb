class User < ApplicationRecord
    # has_many :brands
    has_many :shoes
    has_many :brands, through: :shoes 
    validates :username, :email, presence: true 
    validates :username, :email, uniqueness: true 
    has_secure_password

end