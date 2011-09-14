class CreatePropertyCategories < ActiveRecord::Migration
  def self.up
    create_table :property_categories do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :property_categories
  end
end
