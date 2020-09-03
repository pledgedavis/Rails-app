class User < ApplicationRecord
    has_secure_password
    # has_many :brands
    has_many :shoes
    has_many :brands, through: :shoes 


    validates :username, :email, presence: true 
    validates :username, :email, uniqueness: true 

end