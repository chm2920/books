class CreateProductAttrs < ActiveRecord::Migration
  def self.up
    create_table :product_attrs do |t|
      t.integer :product_id
      t.integer :attr_id
      t.string :val
    end
  end

  def self.down
    drop_table :product_attrs
  end
end
