class CreateAuthorsProducts < ActiveRecord::Migration
  def self.up
    create_table :authors_products, :id => false, :force => true do |t|
      t.integer :author_id
      t.integer :product_id
    end
  end

  def self.down
    drop_table :authors_products
  end
end
