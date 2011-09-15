class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :node_id
      t.integer :category_id
      t.string :title
      t.string :image_file_name
      t.string :sale_price
      t.string :price
      t.integer :num, :null => false, :default => 1
      t.integer :hits, :null => false, :default => 0
      t.integer :is_pub, :null => false, :default => 1
      t.integer :sold, :null => false, :default => 0
      t.integer :is_trash, :null => false, :default => 0
      t.integer :dou_id

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
