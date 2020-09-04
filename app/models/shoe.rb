class Shoe < ApplicationRecord
    belongs_to :brand
    belongs_to :user
    validates :retail_price, :resale_price, :quality, presence: true 
    validates :retail_price, :resale_price, :quality, uniqueness: true 
end