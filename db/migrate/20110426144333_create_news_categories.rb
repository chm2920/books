class CreateNewsCategories < ActiveRecord::Migration
  def self.up
    create_table :news_categories do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :news_categories
  end
end
