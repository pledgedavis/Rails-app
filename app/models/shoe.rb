class Shoe < ApplicationRecord
    belongs_to :brand
    belongs_to :user
    validates :retail_price, :resale_price, length: { minimum: 0, maximum: 9999}
    validates :retail_price, :resale_price, :quality, presence: true 
      
    accepts_nested_attributes_for :brand


end