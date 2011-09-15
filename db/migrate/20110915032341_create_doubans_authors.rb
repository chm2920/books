class CreateDoubansAuthors < ActiveRecord::Migration
  def self.up
    create_table :doubans_authors do |t|
      t.integer :douban_id
      t.integer :author_id
    end
  end

  def self.down
    drop_table :doubans_authors
  end
end
