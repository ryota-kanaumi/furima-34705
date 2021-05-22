class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user,              foreign_key: true
      t.text :product_name,            null: false
      t.text :product_description,     null: false
      t.integer :category_id,          null: false
      t.integer :product_condition_id, null: false 
      t.integer :delivery_charge_id  , null: false
      t.integer :shipping_area_id,     null: false
      t.integer :delivery_day_id,      null: false
      t.integer :price,                null:false
      t.timestamps
    end
  end
end
