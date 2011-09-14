class CreateProductProps < ActiveRecord::Migration
  def self.up
    create_table :product_props do |t|
      t.integer :property_category_id
      t.integer :property_id
      t.integer :product_id
      t.string :val
    end
  end

  def self.down
    drop_table :product_props
  end
end
