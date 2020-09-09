class Brand < ApplicationRecord
    has_many :shoes
    # belongs_to :user, optional: true
    validates :company_name, presence: true 
    validates :company_name, uniqueness: true 


    # scope :order_by_name, -> {left_joins(:shoes).group(:id).order('avg(name) desc')}
end