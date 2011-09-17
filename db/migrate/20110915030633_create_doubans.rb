class CreateDoubans < ActiveRecord::Migration
  def self.up
    create_table :doubans do |t|
      t.integer :dou_id
      t.string :title
      t.string :img
      t.text :summary
      t.string :author
      t.string :tag
      t.text :gets
      t.string :rating
      t.string :numRaters
      t.integer :is_in, :default => 0
    end
  end

  def self.down
    drop_table :doubans
  end
end
