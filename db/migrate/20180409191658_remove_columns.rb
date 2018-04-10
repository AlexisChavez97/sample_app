class RemoveColumns < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :memes, :category
  end

  def self.down
    add_column :memes, :category, :integer
  end
end
