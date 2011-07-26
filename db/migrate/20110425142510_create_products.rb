class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :node_id
      t.integer :category_id
      t.integer :author_id
      t.integer :publish_id
      t.string :title
      t.string :image_file_name
      t.string :old_price
      t.string :price
      t.integer :num, :null => false, :default => 1
      t.integer :hits, :null => false, :default => 0
      t.text :catalogs
      t.text :summary
      t.text :intro
      t.text :property
      t.integer :is_pub, :null => false, :default => 1
      t.integer :sold, :null => false, :default => 0
      t.integer :is_re, :null => false, :default => 0
      t.integer :is_trash, :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
