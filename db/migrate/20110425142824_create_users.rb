class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password
      t.string :last_login_ip
      t.string :current_login_ip
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.integer :login_times, :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
