class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :company_name 
      t.integer :user_id
    end
  end
end
