class Shoe < ApplicationRecord
    belongs_to :brand, optional: true
    belongs_to :user
    
end