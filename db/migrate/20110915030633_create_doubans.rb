class CreateDoubans < ActiveRecord::Migration
  def self.up
    create_table :doubans do |t|
      t.integer :dou_id
      t.string :title
      t.string :category
      t.string :img
      t.string :price
      t.string :author
      t.string :isbn10
      t.string :isbn13
      t.string :publisher
      t.string :pubdate
      t.string :rating
      t.string :numRaters
      t.integer :is_in, :default => 0
    end
  end

  def self.down
    drop_table :doubans
  end
end
