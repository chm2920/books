class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :douban_id
      t.string :title
      t.string :category
      t.string :author
      t.string :image
      t.string :isbn10
      t.string :isbn13
      t.string :price
      t.string :publisher
      t.string :rating
      t.string :numRaters

      t.timestamps
    end
  end
end
