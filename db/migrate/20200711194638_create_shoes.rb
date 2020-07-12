class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|   
       t.string :name 
       t.integer :retail_price
       t.integer :resale_price
       t.string :quality
    end
  end
end
