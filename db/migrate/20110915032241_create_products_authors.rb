class CreateProductsAuthors < ActiveRecord::Migration
  def self.up
    create_table :products_authors do |t|
      t.integer :product_id
      t.integer :author_id
    end
  end

  def self.down
    drop_table :products_authors
  end
end
