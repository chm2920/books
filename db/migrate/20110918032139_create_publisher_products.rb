class CreatePublisherProducts < ActiveRecord::Migration
  def self.up
    create_table :publisher_products do |t|
      t.integer :publisher_id
      t.integer :product_id
    end
  end

  def self.down
    drop_table :publisher_products
  end
end
