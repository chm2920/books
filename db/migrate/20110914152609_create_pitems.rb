class CreatePitems < ActiveRecord::Migration
  def self.up
    create_table :pitems do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :pitems
  end
end
