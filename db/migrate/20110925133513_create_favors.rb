class CreateFavors < ActiveRecord::Migration
  def self.up
    create_table :favors do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :favors
  end
end
