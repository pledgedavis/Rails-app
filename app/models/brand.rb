class Brand < ApplicationRecord
    has_many :shoes
    has_many :users, through: :shoes
    # belongs_to :user, optional: true
    validates :company_name, presence: true 
    validates :company_name, uniqueness: true 
    scope :order_by_name, -> {order(company_name: :desc)}
      

    # scope :order_by_name, -> {left_joins(:shoes).group(:id).order('avg(name) desc')}
end