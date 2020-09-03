class Brand < ApplicationRecord
    has_many :shoes
    # belongs_to :user, optional: true
end