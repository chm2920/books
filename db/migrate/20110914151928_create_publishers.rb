class CreatePublishers < ActiveRecord::Migration
  def self.up
    create_table :publishers do |t|
      t.string :name
      t.text :intro   
    end
  end

  def self.down
    drop_table :publishers
  end
end
