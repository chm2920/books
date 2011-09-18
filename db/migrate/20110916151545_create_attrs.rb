class CreateAttrs < ActiveRecord::Migration
  def self.up
    create_table :attrs do |t|
      t.string :name
    end
    %w{author translator publisher pubdate binding pages isbn10 isbn13}.each do |t|
      Attr.create(:name => t)
    end
  end

  def self.down
    drop_table :attrs
  end
end
