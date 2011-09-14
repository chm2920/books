class CreateNewsTopics < ActiveRecord::Migration
  def self.up
    create_table :news_topics do |t|
      t.integer :news_category_id
      t.string :title
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :news_topics
  end
end
