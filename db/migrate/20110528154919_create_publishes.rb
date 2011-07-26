class CreatePublishes < ActiveRecord::Migration
  def self.up
    create_table :publishes do |t|
      t.string :name
      t.text :intro      
    end
  end

  def self.down
    drop_table :publishes
  end
end
