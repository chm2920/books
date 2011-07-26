class CreateProductProps < ActiveRecord::Migration
  def self.up
    create_table :product_props do |t|
      t.string :zh
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :product_props
  end
end
