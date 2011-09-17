class CreateAttrs < ActiveRecord::Migration
  def self.up
    create_table :attrs do |t|
      t.string :name
    end
    %w{isbn10 isbn13 pages tranlator price author publisher binding}.each do |t|
      Attr.create(:name => t)
    end
  end

  def self.down
    drop_table :attrs
  end
end
