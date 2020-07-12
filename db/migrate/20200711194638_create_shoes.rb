class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|   
       t.string :name 
       t.integer :retail_price
       t.integer :resale_price
       t.integer :quality
       t.integer :user_id
      t.integer :brand_id
    end
  end
end
