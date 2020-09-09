class Shoe < ApplicationRecord
    belongs_to :brand, :dependent => :delete_all
    belongs_to :user
    validates :retail_price, :resale_price, length: { minimum: 0, maximum: 9999}
    validates :retail_price, :resale_price, :quality, presence: true 
      
    accepts_nested_attributes_for :brand


end