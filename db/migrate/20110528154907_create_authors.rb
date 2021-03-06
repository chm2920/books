class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :name
      t.text :intro
    end
  end

  def self.down
    drop_table :authors
  end
end
