class CreateDoubansTags < ActiveRecord::Migration
  def self.up
    create_table :doubans_tags do |t|
      t.integer :douban_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :doubans_tags
  end
end
