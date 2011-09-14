class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.integer :property_category_id
      t.string :name
    end
  end

  def self.down
    drop_table :properties
  end
end
