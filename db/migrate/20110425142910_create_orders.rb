class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.integer :address_id
      t.integer :total_price
      t.integer :state

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
