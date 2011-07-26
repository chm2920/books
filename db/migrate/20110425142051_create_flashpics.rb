class CreateFlashpics < ActiveRecord::Migration
  def self.up
    create_table :flashpics do |t|
      t.string :title
      t.string :image_file_name
      t.string :url
    end
  end

  def self.down
    drop_table :flashpics
  end
end
