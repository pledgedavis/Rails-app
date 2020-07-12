class Brand < ApplicationRecord
    has_many :shoes
    belongs_to :users

end