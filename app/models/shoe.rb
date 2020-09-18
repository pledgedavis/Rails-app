class Shoe < ApplicationRecord
    belongs_to :brand
    # , :dependent => :delete
    belongs_to :user
    validates :retail_price, :resale_price, length: { minimum: 0, maximum: 9999}
    validates :retail_price, :resale_price, :size, presence: true 

    scope :ordered, -> {order(name: :asc)}
      
    accepts_nested_attributes_for :brand, reject_if: :all_blank

    # def brand_attributes=(attr)
    #     # binding.pry    
    #          current_brand = Brand.find_by_id(attr[:id])
    #     if !current_brand     
    #          current_brand = Brand.new(company_name: attr[:company_name])
    #           current_brand.save
    #     end
    #     current_brand.shoes<<(self)
    # end
end
