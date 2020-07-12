class User < ApplicationRecord
    has_many :brands
    has_many :shoes
    has_many :brands, through: :shoes 

end